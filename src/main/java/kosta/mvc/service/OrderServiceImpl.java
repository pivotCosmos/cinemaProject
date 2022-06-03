package kosta.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import kosta.mvc.domain.Orders;
import kosta.mvc.repository.OrdersRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class OrderServiceImpl implements OrderService {

	private final OrdersRepository orderRepo;
	
	@Override
	public List<Orders> selectAll() {
		return orderRepo.findAll();
	}

	@Override
	public Orders selectByOrderCode(Long orderCode) {
		// TODO Auto-generated method stub
		Orders order = orderRepo.findById(orderCode).orElse(null);
		if(order==null) throw new RuntimeException("예매 내역 상세정보를 불러올 수 없습니다.");
		return order;
	}

}