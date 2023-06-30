package com.example.demo.controller;

import com.example.demo.entity.KhachHang;
import com.example.demo.entity.NguoiBan;
import com.example.demo.entity.SanPham;
import com.example.demo.service.GioHangSer;
import com.example.demo.service.HoaDonSer;
import com.example.demo.service.KhachHangSer;
import com.example.demo.service.NguoiBanSer;
import com.example.demo.service.SanPhamSer;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.UUID;

@Controller
public class KhachHangController {

    @Autowired
    KhachHangSer khachHangSer;

    @Autowired
    NguoiBanSer nguoiBanSer;

    @Autowired
    SanPhamSer sanPhamSer;

    @Autowired
    GioHangSer gioHangSer;

    @Autowired
    HoaDonSer hoaDonSer;

    @GetMapping("/asm/dang-nhap")
    public String viewDangKiDangNhap() {
        return "/dang-ki-dang-nhap";
    }

    @GetMapping("/asm/trang-chu")
    public ModelAndView view(@RequestParam(value = "pageNo", required = false, defaultValue = "0") Integer pageNo) {
        Page<SanPham> page = sanPhamSer.view(pageNo, 4);
        ModelAndView mav = new ModelAndView("/trang-chu");
        mav.addObject("page", page);
        return mav;
    }

    @PostMapping("/khach-hang/dang-nhap")
    public String dangNhap(HttpServletRequest request, Model model, HttpSession session) {
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");

        if (email.isEmpty() || pass.isEmpty() || email.trim().length() == 0 || pass.trim().length() == 0) {
            model.addAttribute("loi", "không được để trống");
            return "/dang-ki-dang-nhap";
        } else {
            try {
                KhachHang khachHang = khachHangSer.findAccount(email, pass);
                NguoiBan nguoiBan = nguoiBanSer.findAcount(email, pass);
                if (khachHang != null) {
                    session.setAttribute("idKh", khachHang.getId());
                    return "redirect:/asm/trang-chu";
                } else if (nguoiBan != null) {
                    session.setAttribute("idNb", nguoiBan.getId());
                    return "redirect:/asm/admin-view";
                } else {
                    //Thông tin đăng nhập không chính xác
                    model.addAttribute("loi", "không đúng tài khoản mật khẩu");
                    return "/dang-ki-dang-nhap";
                }
            } catch (Exception e) {
                model.addAttribute("loi", "không đúng tài khoản mật khẩu");
                return "/dang-ki-dang-nhap";
            }
        }
    }

    @PostMapping("/khach-hang/dang-ki")
    public String dangKi(HttpServletRequest request, Model model) {
        String nameDK = request.getParameter("nameDK");
        String sdtDK = request.getParameter("sdtDK");
        String emailDK = request.getParameter("emailDK");
        String passDK = request.getParameter("passDK");
        String diaChiDK = request.getParameter("diaChiDK");

        KhachHang khachHang = new KhachHang();

        if (nameDK.trim().length() == 0 || sdtDK.trim().length() == 0 || emailDK.trim().length() == 0 || passDK.trim().length() == 0 || diaChiDK.trim().length() == 0) {
            model.addAttribute("loi", "không được để trống");
            return "/dang-ki-dang-nhap";
        }

        khachHang.setMa("Ma" + nameDK + sdtDK);
        khachHang.setTen(nameDK);
        khachHang.setSdt(sdtDK);
        khachHang.setEmail(emailDK);
        khachHang.setPass(passDK);
        khachHang.setDiaChi(diaChiDK);

        khachHangSer.add(khachHang);

        model.addAttribute("test", khachHang.getTen());

        return "/dang-ki-dang-nhap";
    }

    @GetMapping("/khach-hang/view")
    public ModelAndView viewKhachHang(@RequestParam(value = "pageNo", required = false, defaultValue = "0") Integer pageNo) {
        Page<KhachHang> page = khachHangSer.viewKhachHang(pageNo, 5);
        ModelAndView mav = new ModelAndView(("/view-ql-khach-hang"));
        mav.addObject("page", page);
        return mav;
    }
}
