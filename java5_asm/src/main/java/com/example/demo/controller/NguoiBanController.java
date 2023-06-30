package com.example.demo.controller;

import com.example.demo.entity.KhachHang;
import com.example.demo.service.CoAoSer;
import com.example.demo.service.GioHangSer;
import com.example.demo.service.HoaDonSer;
import com.example.demo.service.KhachHangSer;
import com.example.demo.service.LoaiAoSer;
import com.example.demo.service.SanPhamSer;
import com.example.demo.service.TayAoSer;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
public class NguoiBanController {

    @Autowired
    SanPhamSer sanPhamSer;

    @Autowired
    CoAoSer coAoSer;

    @Autowired
    LoaiAoSer loaiAoSer;

    @Autowired
    TayAoSer tayAoSer;

    @Autowired
    KhachHangSer khachHangSer;

    @Autowired
    GioHangSer gioHangSer;


    @Autowired
    HoaDonSer hoaDonSer;

    @GetMapping("/asm/admin-view")
    public String adminView() {
        return "/admin-view";
    }
    @GetMapping("/asm/quan-li-khach-hang")
    public ModelAndView quanLiKhachHang(@RequestParam(value = "pageNo",required = false,defaultValue = "0") Integer pageNo){
        Page<KhachHang> page = khachHangSer.viewKhachHang(pageNo,5);
        ModelAndView mav = new ModelAndView("/view-quan-li-khach-hang");
        mav.addObject("page",page);
        return mav;
    }

    @GetMapping("/asm/hoa-don-all")
    public String viewHoaDonAll(HttpSession session, Model model) {
        List<String> listMa = hoaDonSer.findAllHoaDon();
        List<Integer> listTongTien = new ArrayList<>();
        List<String> listTrangThai = new ArrayList<>();
        for (String ma : listMa) {
            listTongTien.add(hoaDonSer.tongTien(ma));
            listTrangThai.add(hoaDonSer.findTrangThai(ma));
        }
        model.addAttribute("listTongTien", listTongTien);
        model.addAttribute("listTrangThai", listTrangThai);
        model.addAttribute("listMa", listMa);
        return "/view-quan-li-don-hang";
    }
}
