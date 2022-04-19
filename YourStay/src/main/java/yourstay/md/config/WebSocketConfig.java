package yourstay.md.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration
@EnableWebSocketMessageBroker//@EnableWebSocketMessageBroker is used to enable our WebSocket server
//WebSocket 서버를 활성화하는 데 사용됩니다.
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {


    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
    	/* 웹 소켓 서버에 연결하는 데 사용할 웹 소켓 엔드 포인트를 등록합니다.
    	  엔드 포인트 구성에 withSockJS ()를 사용합니다.
    	  SockJS는 웹 소켓을 지원하지 않는 브라우저에 폴백 옵션을 활성화하는 데 사용됩니다.*/
        registry.addEndpoint("/ws").withSockJS();
    }


    @Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {
    	//- 한 클라이언트에서 다른 클라이언트로 메시지를 라우팅 하는 데 사용될 메시지 브로커를 구성하고 있습니다.
        registry.setApplicationDestinationPrefixes("/app");
        //- "/app" 시작되는 메시지가 message-handling methods으로 라우팅 되어야 한다는 것을 명시합니다.
        registry.enableSimpleBroker("/topic");
        /*- "/topic" 시작되는 메시지가 메시지 브로커로 라우팅 되도록 정의합니다.
        메시지 브로커는 특정 주제를 구독 한 연결된 모든 클라이언트에게 메시지를 broadcast 합니다.*/
    }
}