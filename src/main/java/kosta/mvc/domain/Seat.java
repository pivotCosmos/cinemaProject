package kosta.mvc.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Seat {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seat_pk")
	@SequenceGenerator(name = "seat_pk", allocationSize = 1, sequenceName = "seat_pk")
	private int seatcode;
	
	@ManyToOne
	@JoinColumn(name="screen_code")
	private Screen screenCode;
	
	@Column(nullable = false, length = 3)
	private String seatRow;
	
	@Column(nullable = false)
	private int seatCol;
	
}
