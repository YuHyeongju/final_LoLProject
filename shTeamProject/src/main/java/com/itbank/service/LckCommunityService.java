package com.itbank.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.component.PagingComponent;
import com.itbank.model.LckBoardDTO;
import com.itbank.repository.LckCommunityDAO;

@Service
public class LckCommunityService {
	
	@Autowired private LckCommunityDAO dao;
	
	private String saveDirectory = "C:\\upload";
	
	public LckCommunityService() {
		File dir = new File(saveDirectory);
		
		if(dir.exists() == false) {
			dir.mkdirs();
		}
	}

	public List<LckBoardDTO> getBoardListByPagingSearchCategory(PagingComponent paging) {
		
		return dao.selectListByPagingSearchCategory(paging);
	}
	
//	public List<LckBoardDTO> getBoardListByPaging(PagingComponent paging) {
//		
//		return dao.selectListByPaging(paging);
//	}

	public List<LckBoardDTO> getBoardListByPagingSearch(PagingComponent paging) {
		
		return dao.selectListByPagingSearchCategory(paging);
	}
	
//	public List<LckBoardDTO> getAjaxBoardList(String category) {
//		
//		return dao.selectAjaxList(category);
//	}
	
	public LckBoardDTO getBoard(int idx) {
		
		return dao.selectOne(idx);
	}

	public int addBoard(LckBoardDTO dto) {
		
		String filename = dto.getUpload().getOriginalFilename();
		
		File f = new File(saveDirectory,filename);
		
		try {
			
			dto.getUpload().transferTo(f);
			
		} catch (IllegalStateException | IOException e) {
			
			e.printStackTrace();
			
		}
		dto.setImage(filename);
		
		return dao.insert(dto);
	}

	public int deleteBoard(int idx) {
		File f = new File(saveDirectory);
		if(f.exists()) {
			f.delete();
		}
		return dao.delete(idx);
	}

	public int modifyBoard(LckBoardDTO dto) {
		String filename = dto.getUpload().getOriginalFilename();
		
		dto.setImage(filename);
		return dao.modify(dto);
	}

	// 전체 게시글 갯수
	public int getBoardCount() {
		
		return dao.boardCount();
	}
	// 검색한 게시글 갯수
	public int getBoardCount(PagingComponent dto) {
			
		return dao.getBoardCountBySearch(dto);
	}
	
	// 카테고리에 맞는 게시글 갯수
	public int getBoardCountByCategory(String category) {
	
		return dao.boardCountByCategory(category);
	}

	public int getReplyCountByBoardIdx(int idx) {
		
		return dao.selectReplyCountByBoardIdx(idx);
	}

	


	



	
	

}
