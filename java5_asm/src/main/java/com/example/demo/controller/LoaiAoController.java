package com.example.demo.controller;

import com.example.demo.entity.CoAo;
import com.example.demo.entity.LoaiAo;
import com.example.demo.entity.SanPham;
import com.example.demo.entity.TayAo;
import com.example.demo.service.CoAoSer;
import com.example.demo.service.LoaiAoSer;
import com.example.demo.service.SanPhamSer;
import com.example.demo.service.TayAoSer;
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

import java.util.List;
import java.util.UUID;

@Controller
public class LoaiAoController {
    @Autowired
    TayAoSer tayAoSer;

    @Autowired
    CoAoSer coAoSer;

    @Autowired
    LoaiAoSer loaiAoSer;

    @Autowired
    SanPhamSer sanPhamSer;

    List<TayAo> listTayAo;

    List<CoAo> listCoAo;

    List<LoaiAo> listLoaiAo;

    List<SanPham> listSanPham;

    @GetMapping("/asm/view-loai-ao")
    public ModelAndView viewLoaiAo(Model model, @RequestParam(value = "pageNo", required = false, defaultValue = "0") Integer pageNo) {
        Page<LoaiAo> page = loaiAoSer.phanTrang(pageNo, 5);
        ModelAndView mav = new ModelAndView("/view-loai-ao");
        mav.addObject("page", page);
        return mav;
    }

    @PostMapping("/loai-ao/add")
    public String addLoaiAo(HttpServletRequest request, HttpSession session) {

        LoaiAo loaiAo = new LoaiAo();

        String ma = request.getParameter("ma");
        String ten = request.getParameter("ten");

        if (ma.trim().length() == 0 || ten.trim().length() == 0) {
            session.setAttribute("loi", "Không được để trống");
            return "redirect:/asm/admin-view#/asm/view-loai-ao";
        } else {

            loaiAo.setMa(ma);
            loaiAo.setTen(ten);

            loaiAoSer.add(loaiAo);

            return "redirect:/asm/admin-view#/asm/view-loai-ao";
        }
    }

    @PostMapping("/loai-ao/update")
    public String updateLoaiAo(HttpServletRequest request, HttpSession session) {

        LoaiAo loaiAo = new LoaiAo();

        String id = request.getParameter("id");
        String ma = request.getParameter("ma");
        String ten = request.getParameter("ten");
        if (ma.isEmpty() || ten.isEmpty()) {
            session.setAttribute("loi", "Không được để trống");
            return "redirect:/asm/admin-view#/asm/view-loai-ao";
        } else {
            loaiAo.setMa(ma);
            loaiAo.setTen(ten);

            loaiAoSer.update(UUID.fromString(id), loaiAo);

            return "redirect:/asm/admin-view#/asm/view-loai-ao";
        }
    }

    @PostMapping("/loai-ao/detail")
    public String detailLoaiAo(Model model, HttpServletRequest request, HttpSession session) {
        String id = request.getParameter("detail");
        LoaiAo loaiAo = loaiAoSer.findId(UUID.fromString(id));
        session.setAttribute("loaiAo", loaiAo);
        return "redirect:/asm/admin-view#/asm/view-loai-ao";
    }

    @PostMapping("/loai-ao/remove")
    public String deleteLoaiAo(Model model, HttpServletRequest request) {
        String id = request.getParameter("delete");
        loaiAoSer.delete(UUID.fromString(id));
        return "redirect:/asm/admin-view#/asm/view-loai-ao";
    }
}
