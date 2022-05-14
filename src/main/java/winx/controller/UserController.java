package winx.controller;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import winx.entity.SanPham;
import winx.entity.TinMoi;

@Transactional
@Controller
@RequestMapping("")
public class UserController {
	@Autowired
	SessionFactory factory;

	@RequestMapping("shop")
	public String Shop(ModelMap model) {
		return "user/shop";
	}

	@RequestMapping("account")
	public String account(ModelMap model) {
		return "user/account";
	}

	@RequestMapping("login")
	public String login(ModelMap model) {
		return "user/login";
	}

	@RequestMapping("register")
	public String register(ModelMap model) {

		return "user/register";
	}
}
