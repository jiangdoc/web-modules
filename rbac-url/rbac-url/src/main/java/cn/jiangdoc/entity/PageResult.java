package cn.jiangdoc.entity;
import java.io.Serializable;
/**
 * 分页结果类
 * @author 蒋文杰
 *
 */
import java.util.List;
public class PageResult implements Serializable{

    private Long total;	//总记录数
    private List rows;	//当前页数据

    public PageResult(long total, List rows) {
        this.total = total;
        this.rows = rows;
    }
    public Long getTotal() {
        return total;
    }
    public void setTotal(Long total) {
        this.total = total;
    }
    public List getRows() {
        return rows;
    }
    public void setRows(List rows) {
        this.rows = rows;
    }

}
