package kosta.mvc.domain;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QEvent is a Querydsl query type for Event
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QEvent extends EntityPathBase<Event> {

    private static final long serialVersionUID = -33106986L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QEvent event = new QEvent("event");

    public final QEventBoard eventBoard;

    public final NumberPath<Long> eventCode = createNumber("eventCode", Long.class);

    public final QMember member;

    public QEvent(String variable) {
        this(Event.class, forVariable(variable), INITS);
    }

    public QEvent(Path<? extends Event> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QEvent(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QEvent(PathMetadata metadata, PathInits inits) {
        this(Event.class, metadata, inits);
    }

    public QEvent(Class<? extends Event> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.eventBoard = inits.isInitialized("eventBoard") ? new QEventBoard(forProperty("eventBoard")) : null;
        this.member = inits.isInitialized("member") ? new QMember(forProperty("member")) : null;
    }

}

