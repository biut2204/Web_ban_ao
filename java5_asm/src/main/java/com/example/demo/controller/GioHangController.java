package com.example.demo.controller;

import com.example.demo.entity.GioHang;
import com.example.demo.entity.KhachHang;
import com.example.demo.entity.SanPham;
import com.example.demo.service.GioHangSer;
import com.example.demo.service.HoaDonSer;
import com.example.demo.service.KhachHangSer;
import com.example.demo.service.SanPhamSer;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.UUID;

@Controller
public class GioHangController {

    @Autowired
    SanPhamSer sanPhamSer;

    @Autowired
    GioHangSer gioHangSer;

    @Autowired
    KhachHangSer khachHangSer;

    @Autowired
    HoaDonSer hoaDonSer;

    @GetMapping("/asm/gio-hang")
    public ModelAndView viewGioHang(@RequestParam(value = "pageNo", required = false, defaultValue = "0") Integer pageNo, HttpSession session) {
        Object idKHObject = session.getAttribute("idKh");
        String idKH;
        if (idKHObject == null) {
            idKH = null;
        } else {
            idKH = idKHObject.toString();
        }
        if (idKH == null) {
            Page<GioHang> page = gioHangSer.viewGioHang(null, pageNo, 5);
            ModelAndView mav = new ModelAndView("/view-gio-hang");
            mav.addObject("page", page);
            return mav;
        } else {
            Page<GioHang> page = gioHangSer.viewGioHang(UUID.fromString(idKH), pageNo, 5);
            ModelAndView mav = new ModelAndView("/view-gio-hang");
            mav.addObject("page", page);
            return mav;
        }
    }

    @PostMapping("/gio-hang/add")
    public String addGioHang(HttpSession session, HttpServletRequest request) {
        String idSP = request.getParameter("idSP");
        GioHang gioHang = new GioHang();
        Object idKHObject = session.getAttribute("idKh");
        String idKH;
        if (idKHObject == null) {
            idKH = null;
        } else {
            idKH = idKHObject.toString();
        }

        if (idKH == null) {

            SanPham sanPham = sanPhamSer.findId(UUID.fromString(idSP));
            gioHang.setSanPham(sanPham);
            gioHang.setMa("Ma" + gioHangSer.soLuongGioHang());
            gioHang.setSoLuong(1);
            gioHangSer.add(gioHang);
        } else {
            KhachHang khachHang = khachHangSer.findId(UUID.fromString(idKH));
            SanPham sanPham = sanPhamSer.findId(UUID.fromString(idSP));
            gioHang.setSanPham(sanPham);
            gioHang.setKhachHang(khachHang);
            gioHang.setMa("Ma" + gioHangSer.soLuongGioHang());
            gioHang.setSoLuong(1);
            gioHangSer.add(gioHang);
        }
        return "redirect:/asm/trang-chu";
    }

    @PostMapping("/gio-hang/clear")
    public String clearGioHang(HttpSession session, HttpServletRequest request) {
        String id = request.getParameter("delete");
        gioHangSer.delete(UUID.fromString(id));
        return "redirect:/asm/gio-hang";
    }
}
