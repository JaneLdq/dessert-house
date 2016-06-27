package edu.nju.dessert.service;

import java.util.ArrayList;
import java.util.List;

import edu.nju.dessert.dao.MemberDao;
import edu.nju.dessert.dao.OrderDao;
import edu.nju.dessert.dao.UserDao;
import edu.nju.dessert.model.Member;
import edu.nju.dessert.model.Order;
import edu.nju.dessert.vo.OrderItemVO;
import edu.nju.dessert.vo.OrderVO;

// 所有拿到的OrderVO中的OrderItemVO中药增加AdditionItemVO
public class OrderServiceImpl implements OrderService {

    private OrderDao orderDao;
    
    private MemberDao memberDao;
    
    private UserDao userDao;
    
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }
    
    public void setMemberDao(MemberDao memberDao) {
        this.memberDao = memberDao;
    }
    
    public void setOrderDao(OrderDao orderDao) {
        this.orderDao = orderDao;
    }
    
    @Override
    public List<OrderVO> getOrderVO(int storeId, int type) {
        List<Order> list = orderDao.getOrderByStore(storeId, type);
        List<OrderVO> voList = new ArrayList<OrderVO>();
        for(Order o: list){
            OrderVO vo = new OrderVO();
            vo.setDate(o.getCreated_at());
            vo.setDiscount(o.getDiscount());
            vo.setTotal(o.getTotal());
            vo.setId(o.getId());
            Member member = memberDao.getMember(o.getUid());
            if(member!=null){
                vo.setMid(member.getMid());
            }
            voList.add(vo);
        }
        return voList;
    }

    @Override
    public OrderVO getOrderById(int id) {
        Order order = orderDao.getOrderById(id);   
        if(order != null){
            List<OrderItemVO> items = orderDao.getOrderItemByOrderId(id);
            Member member = memberDao.getMember(order.getUid());
            String mid = "-";
            String memberName = "-";
            if(member != null){
                mid = member.getMid();
                memberName = userDao.getUser(order.getUid()).getName();
            }
            OrderVO vo = new OrderVO(order.getId(), order.getStore_id(), order.getCreated_at(),
                    order.getSend_date(), mid, memberName, order.getTotal(), order.getDiscount(), items);
            return vo;
        }
        return null;
    }

    @Override
    public List<Order> getOrderByUser(int uid) {
        return orderDao.getOrderByUser(uid);
    }

    @Override
    public List<OrderVO> getOrderVOByUser(int uid, int page) {
        List<Order> orders = orderDao.getOrderByUserPage(uid, page, 6);
        List<OrderVO> vos = new ArrayList<OrderVO>();
        for(Order o: orders){
            List<OrderItemVO> items = orderDao.getOrderItemByOrderId(o.getId());
            OrderVO vo = new OrderVO(o.getId(), o.getStore_id(), o.getCreated_at(), o.getSend_date(),
                    "", "", o.getTotal(), o.getDiscount(), items);
            vos.add(vo);
        }
        return vos;
    }

}
