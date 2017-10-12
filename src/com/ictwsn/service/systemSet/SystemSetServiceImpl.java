package com.ictwsn.service.systemSet;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.ictwsn.bean.OperatorBean;
import com.ictwsn.dao.systemSet.SystemSetDao;

@Service(value="aService")
@Scope("prototype")
public class SystemSetServiceImpl implements SystemSetService{

	@Resource SystemSetDao dao;
}

