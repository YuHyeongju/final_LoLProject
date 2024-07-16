package com.itbank.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.itbank.model.LCKVideoDTO;

@Repository
public interface LCKVideoDAO {

	@Insert("insert into lckvideo (videoUrl,imageUrl,title) values (#{videoUrl},#{imageUrl},#{title})")
	int addVideo(LCKVideoDTO dto);

	@Select("select * from lckVideo")
	List<LCKVideoDTO> getVideos();

	@Delete("delete from lckvideo")
	void deleteVideos();

}
