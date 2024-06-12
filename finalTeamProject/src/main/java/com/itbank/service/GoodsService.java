package com.itbank.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.GoodsDTO;
import com.itbank.repository.GoodsDAO;

@Service
public class GoodsService {
	
	String saveDirectory = "C:\\upload";
	
	
	@Autowired private GoodsDAO dao;

	public int insert(GoodsDTO dto) {
		String fileName = dto.getUpload().getOriginalFilename();
		File f = new File(saveDirectory, fileName);
		
		try {
			dto.getUpload().transferTo(f);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		dto.setImage(fileName);
		
		return dao.insert(dto);
	}

	public List<GoodsDTO> selectList() {
		return dao.selectList();
	}

	public GoodsDTO selectOne(int idx) {
		return dao.selectOne(idx);
	}

	public int delete(int idx) {
		return dao.delete(idx);
	}

	public int increaseQuantity(int idx) {
		return dao.increase(idx);
	}

	public int decreaseQuantity(int idx) {
		return dao.decrease(idx);
	}
	
	public int exchange (int idx) {
        return dao.exchange(idx);
    }
	
	
}
