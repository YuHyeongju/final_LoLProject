package com.itbank.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.itbank.model.LckBoardLikeDTO;
import com.itbank.model.LckReplyLikeDTO;

@Repository
public interface LckLikeDAO {
	// 로그인한 사용자의 게시글 좋아요 추가
	@Insert("insert into lckBoardLike (boardIdx,likey,hate,userid) values (#{boardIdx},1,0,#{userid})")
	int insertBoardLike(LckBoardLikeDTO dto);

	// 로그인한 사용자의 게시글 싫어요 추가
	@Insert("insert into lckBoardLike (boardIdx,likey,hate,userid) values (#{boardIdx},0,1,#{userid})")
	int insertBoardHate(LckBoardLikeDTO dto);

	// 로그인한 사용자의 댓글 좋아요 추가
	@Insert("insert into lckReplyLike (replyIdx,likey,hate,userid) values (#{replyIdx},1,0,#{userid})")
	int insertReplyLike(LckReplyLikeDTO dto);
	
	// 로그인한 사용자의 댓글 싫어요 추가
	@Insert("insert into lckReplyLike (replyIdx,hate,likey,userid) values (#{replyIdx},1,0,#{userid})")
	int insertReplyHate(LckReplyLikeDTO dto);

	// 게시글 좋아요 갯수
	@Select("select count(*) from lckBoardLike where boardIdx = #{idx} and likey = 1")
	int BoardLikeCount(int idx);

	// 게시글 싫어요 갯수
	@Select("select count(*) from lckBoardLike where boardIdx = #{idx} and hate = 1")
	int BoardHateCount(int idx);

	// 로그인한 사람의 게시글 좋아요 싫어요 정보
	@Select("select * from lckBoardLike where boardIdx = #{boardIdx} and userid = #{userid}")
	LckBoardLikeDTO selectBoardLikeOne(LckBoardLikeDTO likeDTO);

	// 로그인한 사람의 댓글 하나의 좋아요 싫어요 정보
	@Select("select * from lckReplyLike where replyIdx = #{replyIdx} and userid = #{userid}")
	LckReplyLikeDTO selectReplyLike(LckReplyLikeDTO dto);
	
	@Select("select * from lckReplyLike where userid = #{userid}")
	List<LckReplyLikeDTO> selectReplyLikeList(String string);
	// 댓글 좋아요 갯수
	@Select("select count(*) from lckReplyLike where replyIdx = #{idx} and likey = 1")
	int selectReplyLikeCount(int idx);

	// 댓글 싫어요 갯수
	@Select("select count(*) from lckReplyLike where replyIdx = #{idx} and hate = 1")
	int selectReplyHateCount(int idx);

	// 로그인한 사용자의 게시글 좋아요 수정
	@Update("update lckBoardLike set likey = 1 - likey  where boardIdx = #{boardIdx} and userid = #{userid}")
	int updateBoardLike(LckBoardLikeDTO dto);

	// 로그인한 사용자의 게시글 싫어요 수정
	@Update("update lckBoardLike set Hate = 1 - Hate where boardIdx = #{boardIdx} and userid = #{userid}")
	int updateBoardHate(LckBoardLikeDTO dto);

	// 로그인한 사용자의 댓글 좋아요 수정
	@Update("update lckReplyLike set likey = 1 - likey where replyIdx = #{replyIdx} and userid = #{userid}")
	int updateReplyLike(LckReplyLikeDTO dto);

	// 로그인한 사용자의 댓글 싫어요 수정
	@Update("update lckReplyLike set hate = 1 - hate where replyIdx = #{replyIdx} and userid = #{userid}")
	int updateReplyHate(LckReplyLikeDTO dto);

	
	
	

}
