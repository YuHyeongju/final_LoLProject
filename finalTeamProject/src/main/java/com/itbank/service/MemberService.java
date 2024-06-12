package com.itbank.service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.component.HashComponent;
import com.itbank.model.GoodsDTO;
import com.itbank.model.LoginLogDTO;
import com.itbank.model.MapperDTO;
import com.itbank.model.MemberDTO;
import com.itbank.model.MemberGoodsDTO;
import com.itbank.repository.MemberDAO;

@Service
public class MemberService {

	@Autowired private MemberDAO dao;
	@Autowired private HashComponent hc;
	private String saveDirectory = "C:\\upload";

	public int dupCheck(String userid) {
		return dao.dupCheck(userid);
	}

	public MemberDTO login(MemberDTO dto) {
		String hash = hc.getHash(dto.getUserpw());
		hash = hash.substring(3,12);
		dto.setUserpw(hash);
		return dao.login(dto);
	}

	public int join(MemberDTO dto) {
		File f = new File(saveDirectory);
		if(f.exists() == false)f.mkdirs();
		String originalFileName = dto.getUpload().getOriginalFilename();
		String[] arr = originalFileName.split("\\.");
		String tmp = "." + arr[1];
		String randomName = hc.getHash(arr[0]);
		randomName = randomName.substring(3,10);
		randomName += tmp;
		dto.setProfile(randomName);
		File img = new File(saveDirectory,randomName);
		try {
			dto.getUpload().transferTo(img);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String hash = hc.getHash(dto.getUserpw());
		hash = hash.substring(3,12);
		dto.setUserpw(hash);
		return dao.join(dto);
	}

	public MemberDTO findMember(MemberDTO dto) {
		return dao.findMember(dto);
	}

	public int updatePass(MemberDTO dto) {
		String hash = hc.getHash(dto.getUserpw());
		hash = hash.substring(3,12);
		dto.setUserpw(hash);
		return dao.updatePass(dto);
	}

	public int updateNewPass(MemberDTO dto) {
		String hash = hc.getHash(dto.getNewPassword());
		hash = hash.substring(3,12);
		dto.setNewPassword(hash);
		return dao.updateNewPass(dto);
	}
	
	// 알림 상태 거절로 변경
	public int denyNotice(String userid) {
		return dao.denyNotice(userid);
	}

	public int addloginInfo(String userid) {
		return dao.addLoginInfo(userid);
	}

	public LoginLogDTO getLastLog(String userid) {
		return dao.getLastLog(userid);
	}

	public int givePoint(String userid) {
		return dao.givePoinst(userid);
	}

	public int modifyProfile(MemberDTO dto) {
		File f = new File(saveDirectory);
		if(f.exists() == false)f.mkdirs();
		String originalFileName = dto.getUpload().getOriginalFilename();
		System.out.println(originalFileName);
		String[] arr = originalFileName.split("\\.");
		String tmp = "." + arr[1];	
		String randomName = hc.getHash(arr[0]);
		randomName = randomName.substring(3,10);
		randomName += tmp;
		dto.setProfile(randomName);
		File img = new File(saveDirectory,randomName);
		try {
			dto.getUpload().transferTo(img);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dao.modifyProfile(dto);
	}

	public int modifyNickNameOnly(MemberDTO dto) {
		return dao.modifyNickNameOnly(dto);
	}
	
	// 민서
	public GoodsDTO selectOne(int goodsIdx) {
		return dao.selectOne(goodsIdx);
	}

	

	public int updategoodssaled(int product) {
		return dao.updatesaled(product);
	}
	public int updateSale(int product) {
		return dao.productinfo(product);
	}

	public int insertOrUpdateMemberGoods(MemberGoodsDTO memberGoods) {
        return dao.insertOrUpdateMemberGoods(memberGoods);
    }

	public int updateTickets(MapperDTO map) {
		return dao.updateTickets(map);
	}

	public List<MemberGoodsDTO> getUserProductList(String userid) {
		return dao.getUserProductList(userid);
	}

}
