package com.campkok.camp.notice.model.vo;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class CampNoticeVORowMapper implements RowMapper {

	@Override
	public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
		CampNoticeVO n = new CampNoticeVO();
		n.setCeoNoticeNo(rs.getInt("ceo_notice_no"));
		n.setCeoNoticeTitle(rs.getString("ceo_notice_title"));
		n.setUserId(rs.getString("user_id"));
		n.setCeoNoticeDate(rs.getString("ceo_notice_date"));
		n.setCeoNoticeContents(rs.getString("ceo_notice_contents"));
		n.setCeoNoticeFilename(rs.getString("ceo_notice_filename"));
		n.setCeoNoticefilePath(rs.getNString("ceo_notice_filepath"));
		return n;
	}
	
	
}
