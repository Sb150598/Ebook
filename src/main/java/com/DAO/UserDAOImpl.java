package com.DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDAOImpl implements  UserDAO {
	
	private Connection conn;
	
	public UserDAOImpl(Connection conn)
	{
		super();
		this.conn=conn;
	}

	public boolean userRegister(User us) {
		
		boolean f = false;
		
		try {
			
			String query="INSERT INTO user(name,email,phno,password) VALUES(?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(query);
		
			ps.setString(1,us.getName());
			ps.setString(2,us.getEmail());
			ps.setString(3,us.getPhno());
			ps.setString(4,us.getPassword());
			
			int i=ps.executeUpdate();
			
			if(i==1)
			{
				f=true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	@Override
	public User login(String email, String password) {
		User us=null;
		
		try {
			
			String sql="select * from user where email=? and password=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,email);
			ps.setString(2,password);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				us=new User();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));;
				us.setEmail(rs.getString(3));
				us.setPhno(rs.getString(2));
				us.setPassword(rs.getString(2));
				us.setAddress(rs.getString(2));
				us.setLandmark(rs.getString(2));
				us.setCity(rs.getString(2));
				us.setState(rs.getString(2));
				us.setPincode(rs.getString(2));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return us;
	}

	@Override
	public boolean checkPassword(int id,String ps) {
		boolean f=true;
		try {
			String sql="select * from user where id=? and password=?";
			PreparedStatement ps1=conn.prepareStatement(sql);
			
			ps1.setInt(1, id);
			ps1.setString(2, ps);
			
			
			ResultSet rs = ps1.executeQuery();
			
			while(rs.next())
			{	 
				f=false;	
			}		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	@Override
	public boolean updateProfile(User u) {
		boolean f=true;
		
		try {
			
			String query=" update user set name=? and email=? and phno=? where id=?";
			PreparedStatement ps=conn.prepareStatement(query);
		
			ps.setString(1,u.getName());
			ps.setString(2,u.getEmail());
			ps.setString(3,u.getPhno());
			ps.setInt(4, u.getId());
			int i=ps.executeUpdate();
			
			if(i==1)
			{
				f=true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	

}
