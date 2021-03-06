package kosta.mvc.domain;


import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "event")
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Event {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "event_code_seq")
	@SequenceGenerator(sequenceName = "event_code_seq", allocationSize = 1, name = "event_code_seq")
	private Long eventCode;
	
	@ManyToOne
	@JoinColumn(name = "id")
	private Member member;
	
	@ManyToOne
	@JoinColumn(name = "event_bno")
	private EventBoard eventBoard;
	
	
}
