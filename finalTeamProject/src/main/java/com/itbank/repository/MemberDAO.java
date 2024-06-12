package com.itbank.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.itbank.model.GoodsDTO;
import com.itbank.model.LoginLogDTO;
import com.itbank.model.MapperDTO;
import com.itbank.model.MemberDTO;
import com.itbank.model.MemberGoodsDTO;

@Repository
public interface MemberDAO {

	@Select("select count(*) from lckMember where userid = #{userid}")
	int dupCheck(String userid);

	@Select("select * from lckMember where userid = #{userid} and userpw = #{userpw}")
	MemberDTO login(MemberDTO dto);

	@Insert("insert into lckMember (grade,locked,userid,userpw,nickName,email,favoriteTeam,mainPosition,subPosition,profile) values (#{grade},#{locked},#{userid},#{userpw},#{nickName},#{email},#{favoriteTeam},#{mainPosition},#{subPosition},#{profile})")
	int join(MemberDTO dto);

	@Select("select * from lckmember where userid = #{userid} and email = #{email}")
	MemberDTO findMember(MemberDTO dto);

	@Update("update lckMember set userpw = #{userpw} where userid = #{userid}")
	int updatePass(MemberDTO dto);

	@Update("update lckMember set userpw = #{newPassword} where userid = #{userid}")
	int updateNewPass(MemberDTO dto);

	@Update("update lckMember set denyNotice = 1 - denyNotice where userid = #{userid} ")
	int denyNotice(String userid);

	@Insert("insert into lcklogininfo (userid) values (#{userid})")
	int addLoginInfo(String userid);

	@Select("select * from lckloginInfo where userid = #{userid} order by loginTime desc FETCH FIRST 1 ROWS ONLY")
	LoginLogDTO getLastLog(String userid);

	@Update("update lckmember set point = point + 100 where userid = #{userid}")
	int givePoinst(String userid);

	@Update("update lckmember set nickName = #{nickName}, profile = #{profile} where userid = #{userid} ")
	int modifyProfile(MemberDTO dto);

	@Update("update lckmember set nickName = #{nickName} where userid = #{userid}")
	int modifyNickNameOnly(MemberDTO dto);

	
	// 민서
	 // 여러 항목을 불러오기 위해  WHERE idx = #{idx} 삭제 --- (20240312)
    @Select("SELECT * FROM lckMemberGoods order by idx")
    List<MemberGoodsDTO> getMemberGoodsList();
    
//    @Select("SELECT * FROM lckMemberGoods WHERE userid = #{userid}")
//    List<MemberGoodsDTO> getMemberGoodsListByUserid(String userid);
    
    @Select("SELECT mg.idx AS idx, " +
            "mg.goodsIdx AS goodsIdx, " +
            "mg.userid AS userid, " +
            "mg.count AS count, " +
            "g.name AS goodsName, " +
            "g.image AS goodsImage " +
            "FROM lckMemberGoods mg " +
            "JOIN lckGoods g ON mg.goodsIdx = g.idx " +
            "WHERE mg.userid = #{userid}")
    List<MemberGoodsDTO> getMemberGoodsListByUserid(String userid);
    

    @Select("select * from lckgoods where idx = #{goodsIdx}")
	GoodsDTO selectOne(int goodsIdx);
    
    @Select("SELECT name, image FROM lckGoods WHERE idx = #{goodsIdx}")
    GoodsDTO selectGoods(int goodsIdx);
    
    @Select("SELECT * FROM lckGoods WHERE idx = #{idx}")
    GoodsDTO selectGoodsByIdx(int idx);
    
    @Update("update lckgoods set productCount = productCount - 1 where idx = #{product}")
	int productinfo(int product);

    
//    @Update("update lckmember set ticket = ticket - #{ticket} where idx = #{idx}")
//    int updateTicket(MapperDTO map);
    
//    @Update("update lckmember set ticket = ticket - #{ticket} where idx = #{idx}")
//    int updateTickets(int tickets);

    @Update("update lckmember set ticket = ticket - #{ticket} where idx = #{memberIdx}")
    int updateTickets(MapperDTO map);
    
    @Update("update lckgoods set saled = saled + 1 where idx = #{idx}")
    int updatesaled(int product);
    
    // @Update("update lckMemberGoods set count = count + 1 where idx = #{idx}")
    
    @Insert("MERGE INTO lckMemberGoods dst " +
            "USING (SELECT #{goodsIdx} AS goodsIdx, #{userid} AS userid FROM dual) src " +
            "ON (dst.goodsIdx = src.goodsIdx AND dst.userid = src.userid) " +
            "WHEN MATCHED THEN " +
            "  UPDATE SET dst.count = dst.count + 1 " +
            "WHEN NOT MATCHED THEN " +
            "  INSERT (goodsIdx, userid, count) VALUES (src.goodsIdx, src.userid, 1)")
    int insertOrUpdateMemberGoods(MemberGoodsDTO memberGoods);

    @Select("select ms.count,(select name from lckgoods where idx = ms.goodsidx) as goodsName,(select image from lckgoods where idx = ms.goodsidx) as goodsImage "
    		+ " from lckmembergoods ms where userid = #{userid}")
	List<MemberGoodsDTO> getUserProductList(String userid);
    
}
