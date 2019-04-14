package cn.jiangdoc.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class SysPermission {
    private String id;

    private String name;

    private String type;

    private String url;

    private String icon;

    private String percode;

    private String parentid;

    private String parentids;

    private Integer sortstring;

    private String createId;

    private Date createTime;

    private Integer available;
    private boolean open = true;
   	private boolean checked = false;
   	private List<SysPermission> children = new ArrayList<SysPermission>();
   	
   	
   	
       public boolean isOpen() {
   		return open;
   	}

   	public void setOpen(boolean open) {
   		this.open = open;
   	}

   	public boolean isChecked() {
   		return checked;
   	}

   	public void setChecked(boolean checked) {
   		this.checked = checked;
   	}

   	public List<SysPermission> getChildren() {
   		return children;
   	}

   	public void setChildren(List<SysPermission> children) {
   		this.children = children;
   	}
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon == null ? null : icon.trim();
    }

    public String getPercode() {
        return percode;
    }

    public void setPercode(String percode) {
        this.percode = percode == null ? null : percode.trim();
    }

    public String getParentid() {
        return parentid;
    }

    public void setParentid(String parentid) {
        this.parentid = parentid == null ? null : parentid.trim();
    }

    public String getParentids() {
        return parentids;
    }

    public void setParentids(String parentids) {
        this.parentids = parentids == null ? null : parentids.trim();
    }

    public Integer getSortstring() {
        return sortstring;
    }

    public void setSortstring(Integer sortstring) {
        this.sortstring = sortstring;
    }

    public String getCreateId() {
        return createId;
    }

    public void setCreateId(String createId) {
        this.createId = createId == null ? null : createId.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getAvailable() {
        return available;
    }

    public void setAvailable(Integer available) {
        this.available = available;
    }
}