//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace quanlycycybergames.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class May
    {
        public string ID_May { get; set; }
        public string TenMay { get; set; }
        public string GiaMay { get; set; }
        public bool? HoatDong { get; set; }
        public Nullable<System.DateTime> ThoiGianMo { get; set; }
        public Nullable<System.DateTime> ThoiGianTat { get; set; }
        public Nullable<decimal> TongTien { get; set; }
        public string ID_TaiKhoan { get; set; }
    
        public virtual TaiKhoan TaiKhoan { get; set; }
    }
}
