//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace quanlycybergams.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Kho
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Kho()
        {
            this.DichVus = new HashSet<DichVu>();
        }
    
        public string ID_Mathang { get; set; }
        public string TenMatHang { get; set; }
        public string SoLuong { get; set; }
        public string TinhTrang { get; set; }
        public Nullable<System.DateTime> NgayNhap { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DichVu> DichVus { get; set; }
    }
}