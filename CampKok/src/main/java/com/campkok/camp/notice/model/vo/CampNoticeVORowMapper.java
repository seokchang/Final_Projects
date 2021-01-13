package com.campkok.camp.notice.model.vo;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class CampNoticeVORowMapper implements RowMapper {

	@Override
	public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
		CampNoticeVO n = new CampNoticeVO();
		n.setCampNoticeNo(rs.getInt("camp_notice_no"));
		n.setCampNoticeTitle(rs.getString("camp_notice_title"));
		n.setCampNo(rs.getInt("camp_no"));
		n.setCampNoticeDate(rs.getString("camp_notice_date"));
		n.setCampNoticeContents(rs.getString("camp_notice_contents"));
		n.setCampNoticeFilename(rs.getString("camp_notice_filename"));
		n.setCampNoticefilePath(rs.getNString("camp_notice_filepath"));
		return n;
	}
	
	
}
