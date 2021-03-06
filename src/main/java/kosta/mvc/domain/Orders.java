package kosta.mvc.domain;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
//@ToString
public class Orders {

	@Id
	@NonNull
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "order_pk")
	@SequenceGenerator(name = "order_pk", allocationSize = 1, sequenceName = "order_pk")
	private Long orderCode;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="id")
	private Member member;
	
	@CreationTimestamp
	private LocalDateTime orderDate;

	private int pointPrice;
	
	@Column(nullable=false)
	private int totalPrice;
	
	private int orderState;
	
	@OneToMany(mappedBy = "order", cascade = CascadeType.ALL)
	private List<MovieOrderline> movieOrderline;
	
	@OneToMany(mappedBy = "order", cascade = CascadeType.ALL)
	private List<FoodOrderline> foodOrderline;
}
