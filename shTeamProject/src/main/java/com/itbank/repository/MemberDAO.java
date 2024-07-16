package com.itbank.repository;

import java.util.List;
import org.springframework.stereotype.Repository;

import com.itbank.model.GoodsDTO;
import com.itbank.model.LoginLogDTO;
import com.itbank.model.MapperDTO;
import com.itbank.model.MemberDTO;
import com.itbank.model.MemberGoodsDTO;

@Repository
public interface MemberDAO {

	int dupCheck(String userid);

	MemberDTO login(MemberDTO dto);

	int join(MemberDTO dto);

	MemberDTO findMember(MemberDTO dto);

	int updatePass(MemberDTO dto);

	int updateNewPass(MemberDTO dto);

	int denyNotice(String userid);

	int addLoginInfo(String userid);

	LoginLogDTO getLastLog(String userid);

	int givePoinst(String userid);

	int modifyProfile(MemberDTO dto);

	int modifyNickNameOnly(MemberDTO dto);

	// 민서
	// 여러 항목을 불러오기 위해  WHERE idx = #{idx} 삭제 --- (20240312)
    List<MemberGoodsDTO> getMemberGoodsList();

    List<MemberGoodsDTO> getMemberGoodsListByUserid(String userid);

	GoodsDTO selectOne(int goodsIdx);

    GoodsDTO selectGoods(int goodsIdx);

    GoodsDTO selectGoodsByIdx(int idx);

	int productinfo(int product);

    int updateTickets(MapperDTO map);

    int updatesaled(int product);

    int insertOrUpdateMemberGoods(MemberGoodsDTO memberGoods);

	List<MemberGoodsDTO> getUserProductList(String userid);

	void updateNotice(String userid);

	int noImgJoin(MemberDTO dto);
    
}
