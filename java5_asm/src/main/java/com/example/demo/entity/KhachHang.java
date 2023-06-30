package com.example.demo.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(name = "Khach_Hang")
public class KhachHang {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "Id")
    UUID id;

    @Column(name = "Ma")
    String ma;

    @Column(name = "Ten")
    String ten;

    @Column(name = "DiaChi")
    String diaChi;

    @Column(name = "Sdt")
    String sdt;

    @Column(name = "Email")
    String email;

    @Column(name = "MatKhau")
    String pass;

    @Column(name = "TrangThai")
    String trangThai;
}
