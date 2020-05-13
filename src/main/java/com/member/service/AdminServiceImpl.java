package com.member.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.member.dao.AdminDao;
import com.member.vo.Member_InfoVo;
@Service("adminService")
public class AdminServiceImpl implements AdminService {
	@Resource(name="adminDao")
	protected AdminDao adminDao;
	@Override
	public List<Member_InfoVo> listMemberAll(Map map) {
		// TODO Auto-generated method stub
		return adminDao.listMemberAll(map);
	}

	@Override
	public int deleteMember(int mem_no) {
		// TODO Auto-generated method stub
		return adminDao.deleteMember(mem_no);
	}
	@Override
	public int totalRecord(Map map) {
		// TODO Auto-generated method stub
		return adminDao.totalRecord(map);
	}
}
