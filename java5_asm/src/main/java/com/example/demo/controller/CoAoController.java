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
public class CoAoController {
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

    @GetMapping("/asm/view-co-ao")
    public ModelAndView viewCoAo(Model model, @RequestParam(value = "pageNo", required = false, defaultValue = "0") Integer pageNo) {
        Page<CoAo> page = coAoSer.phanTrang(pageNo, 5);
        ModelAndView mav = new ModelAndView("/view-co-ao");
        mav.addObject("page", page);
        return mav;
    }

    @PostMapping("/co-ao/add")
    public String addCoAo(HttpServletRequest request, HttpSession session) {

        CoAo coAo = new CoAo();

        String ma = request.getParameter("ma");
        String ten = request.getParameter("ten");

        if (ma.trim().length() == 0 || ten.trim().length() == 0) {
            session.setAttribute("loi", "Không được để trống");
            return "redirect:/asm/admin-view#/asm/view-co-ao";
        } else {

            coAo.setMa(ma);
            coAo.setTen(ten);

            coAoSer.add(coAo);

            return "redirect:/asm/admin-view#/asm/view-co-ao";
        }
    }

    @PostMapping("/co-ao/update")
    public String updateCoAo(HttpServletRequest request, HttpSession session) {

        CoAo coAo = new CoAo();

        String id = request.getParameter("id");
        String ma = request.getParameter("ma");
        String ten = request.getParameter("ten");
        if (ma.isEmpty() || ten.isEmpty()) {
            session.setAttribute("loi", "Không được để trống");
            return "redirect:/asm/admin-view#/asm/view-co-ao";
        } else {
            coAo.setMa(ma);
            coAo.setTen(ten);

            coAoSer.update(UUID.fromString(id), coAo);

            return "redirect:/asm/admin-view#/asm/view-co-ao";
        }
    }

    @PostMapping("/co-ao/detail")
    public String detailCoAo(Model model, HttpServletRequest request, HttpSession session) {
        String id = request.getParameter("detail");
        CoAo coAo = coAoSer.findId(UUID.fromString(id));
        session.setAttribute("coAo", coAo);
        return "redirect:/asm/admin-view#/asm/view-co-ao";
    }

    @PostMapping("/co-ao/remove")
    public String deleteCoAo(Model model, HttpServletRequest request) {
        String id = request.getParameter("delete");
        coAoSer.delete(UUID.fromString(id));
        return "redirect:/asm/admin-view#/asm/view-co-ao";
    }


}
