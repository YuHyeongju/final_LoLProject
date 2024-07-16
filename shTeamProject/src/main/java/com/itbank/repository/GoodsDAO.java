package com.itbank.repository;

import java.util.List;

import com.itbank.model.GoodsDTO;

public interface GoodsDAO {
	
	
	int insert(GoodsDTO dto);

	List<GoodsDTO> selectList();

	GoodsDTO selectOne(int idx);

	int delete(int idx);

	int increase(int idx);

	int decrease(int idx);
	
	int exchange(int idx); // DAO에 교환 기능을 위한 메서드 추가

}
