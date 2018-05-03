package com.evaluation.services;

import java.util.ArrayList;
import java.util.Collection;

import com.evaluation.DAO.UserDaoImpl;
import com.evaluation.models.Utilisateur;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority ;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("userDetailsService")
public class UserDetailsServiceImpl implements UserDetailsService {

	@Autowired
	private UserDaoImpl UserDAO;


	@Transactional(readOnly = true)
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		Utilisateur user = UserDAO.findUserByName(username); //our own User model class
		
		if(user!=null){
			String password = user.getPassword();

			//additional information on the security object
			boolean enabled = true;
			boolean accountNonExpired = true;
			boolean credentialsNonExpired = true;
			boolean accountNonLocked = true;
			
			//Let's populate user roles
			Collection<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();

			authorities.add(new SimpleGrantedAuthority (user.getRoles()));

			
			//Now let's create Spring Security User object
			org.springframework.security.core.userdetails.User securityUser = new 
					org.springframework.security.core.userdetails.User(username, password,enabled , accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
			return securityUser;
		}else{
			throw new UsernameNotFoundException("User Not Found!!!");
		}
	}

}
