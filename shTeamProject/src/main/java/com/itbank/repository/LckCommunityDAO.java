package com.itbank.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.itbank.component.PagingComponent;
import com.itbank.model.LckBoardDTO;

@Repository 
public interface LckCommunityDAO {
	
	// 리스트를 불러올 때 카테고리 검색어 페이지를 유지한채로 불러오는 쿼리문
	@Select("select * from lckBoard" + 
			"    where "
			+ "category like '%' || #{category} || '%' and " + 
			"        (title like '%' || #{search} || '%' or " +
			"		 writer like '%' || #{search} || '%')" +
			"    order by isNotice desc,"
			+ "	 writeDate desc"+ 
			"    offset #{offset} rows" + 
			"    fetch next #{fetch} rows only")
	List<LckBoardDTO> selectListByPagingSearchCategory(PagingComponent paging);
	

	// 전체 게시글의 갯수 
	@Select("select count(*) from lckBoard")
	int boardCount();
	
	// 검색한 결과 게시글 갯수
	@Select("select count(*) from lckBoard where category like '%' || #{category} || '%' and (title like '%' || #{search} || '%' or "
			+ "									 content like '%' || #{search} || '%')")
	int getBoardCountBySearch(PagingComponent dto);
	
	// 게시글 상세보기
	@Select("select * from lckBoard where idx = #{idx}")
	LckBoardDTO selectOne(int idx);

	//게시글 추가
	@Insert("insert into lckBoard (title,writer,content,category,image,isNotice)"
			+ " values (#{title},#{writer},#{content},#{category},#{image},#{isNotice})") 
	int insert(LckBoardDTO dto);
	
	// 게시글 삭제 
	@Delete("delete from lckBoard where idx = #{idx}")
	int delete(int idx);
	// 게시글 수정
	@Update("update lckBoard set title = #{title}, content = #{content}, category = #{category},"
			+ "image = #{image}, isNotice = #{isNotice} where idx = #{idx} ")
	int modify(LckBoardDTO dto);
	
	// 카테고리에 맞는  게시글 갯수
	@Select("select count(*) from lckBoard where category = #{category}")
	int boardCountByCategory(String category);
	
	// 게시글의 댓글 갯수 구하기
	@Select("select count(*) as ReplyCount from lckReply where boardIdx = #{idx}")
	int selectReplyCountByBoardIdx(int idx);


	
	

	
	

}
