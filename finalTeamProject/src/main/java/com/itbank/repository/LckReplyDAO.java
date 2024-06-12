package com.itbank.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.itbank.model.LckReplyDTO;

@Repository
public interface LckReplyDAO {
	
	@Insert("insert into lckReply (boardIdx,writer,content) values(#{boardIdx},#{writer},#{content})")
	int insert(LckReplyDTO dto);

	@Select("select b.*," + 
			"    (select count(*) from lckreplylike where replyidx = b.idx and likey = 1)as replyLikeCount,"
			+"	(select count(*) from lckreplylike where replyIdx = b.idx and hate = 1)as replyHateCount" + 
			" from lckreply b where boardIdx = #{idx}")
	List<LckReplyDTO> selectReplyList(int idx);

	@Delete("delete lckReply where idx = #{idx}")
	int deleteReply(int idx);

	
	@Update("update lckReply set writer = #{writer}, content = #{content} where idx = #{idx}")
	int modifyReply(LckReplyDTO dto);

	
	@Select("select * from lckReply where boardIdx = #{idx} order by idx desc")
	LckReplyDTO selectReply(int idx);

	@Select("select count(*) from lckReply where boardIdx = #{idx}")
	int selectReplyCountByBoardIdx(int idx);

	

}
