package kosta.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import kosta.mvc.domain.Orders;
import kosta.mvc.dto.SalesTotalDTO;
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

	@Override
	public List<SalesTotalDTO> selectMonthlySalesList() {
		System.out.println("OrderServiceImpl의 selectMonthlySalesList() call...");
		List<SalesTotalDTO> monthlySalesList = orderRepo.selectMonthlySalesList();
		monthlySalesList.forEach(item->System.out.println(item.getCount() + ", " + item.getDatedata() + ", " + item.getTotal_Price()));
		
		System.out.println("monthlySalesList = " + monthlySalesList);
		return monthlySalesList;
	}

	@Override
	public List<SalesTotalDTO> selectYearlySalesList() {
		System.out.println("OrderServiceImpl의 selectYearlySalesList() call...");
		List<SalesTotalDTO> yearlySalesList = orderRepo.selectYearlySalesList();
		yearlySalesList.forEach(item->System.out.println(item.getCount() + ", " + item.getDatedata() + ", " + item.getTotal_Price()));
		
		System.out.println("yearlySalesList = " + yearlySalesList);
		return yearlySalesList;
	}

}
