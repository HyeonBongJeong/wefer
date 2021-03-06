package com.kh.wefer.socket;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ReplyEchoHandler extends TextWebSocketHandler {
	// 모든 사용자
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();

	// 로그인중인 개별유저
	Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();

	// 클라이언트가 서버로 연결시
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("커넥션됐니  :" + session);
		sessions.add(session); // 로그인한 세션아이디가 들어감
		// 세션값을 불러온 0번째 중괄호에 session.getId()를 넣으라는 뜻임.
		log(session.getId() + "연결됨 / 알림소켓 ");

		String senderId = getMemberId(session); // 접속한 유저의 http세션을 조회하여 id를 얻는 함수
		if (senderId != null) { // 로그인 값이 있는 경우만
			log(senderId + " 연결 됨");
			users.put(senderId, session); // 로그인중인 유저 저장
			for (WebSocketSession sess : sessions) {
				
					sess.sendMessage(new TextMessage(senderId));
				
			}
		}
	}

	// 클라이언트가 Data 전송 시
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("핸들러 텍스트 메세지 :" + session + ":" + message.getPayload());
		String sender = getMemberId(session);
//			String senderId =session.getPrincipal().getName(); 

		// log("senderId: "+ sender);
//			for (WebSocketSession sess:sessions) {
//				sess.sendMessage(new TextMessage(senderId+ ":"+message));
//			}
		// protocol :cmd, 로그인해서 휴가계 올리는 사람 (로그인한사람), 참조할사람, paymeny_id ) (reply, test1,
		// test5, 510)
		// 특정 유저에게 보내기
		String msg = message.getPayload();
		// log("msg: "+ msg);
		if (msg != null) {
			String[] strs = msg.split(",");
			// log(strs.toString());
			// log("strs.length: " + strs.length);
			if (strs != null && strs.length == 2) {

				// log("strs.length 2: " + strs.length);

				String cmd = strs[0];
				String target = strs[1]; // m_id 저장
				log(cmd);
				log(target);
				// String content = strs[2];
				// String url = strs[3];
				// log("strs.length 3: " + strs.length);

				for (WebSocketSession sess : sessions) {
					if (cmd.equals("대화에 초대")) {
						sess.sendMessage(new TextMessage("<li><a href='./chat.do' style = \"color: blue;\" >"
								+ sender + "님이 " + cmd + "했습니다</a></li>"));
					}
						
					

					WebSocketSession targetSession = users.get(target); // 수신을 받을 세션 조회
					log("strs.length 4: " + strs.length);
					// 실시간 접속시
					if (targetSession != null) {
						System.out.println("실시간 접속했나");
						
						if (true) {
							log("strs.length 5: " + strs.length);
							log(strs.toString());
							if (cmd.equals("전자결재")) {
								TextMessage tmpMsg = new TextMessage("<li><a href='./approval.do' style = \"color: blue;\" >"
										+ sender + "님이 " + cmd + "를 등록했습니다</a></li>");
								targetSession.sendMessage(tmpMsg);
								
							}else {
								TextMessage tmpMsg = new TextMessage("<li><a href='./projectlist.do' style = \"color: blue;\" >"
										+ sender + "님이 " + cmd + "를 등록했습니다</a></li>");
								targetSession.sendMessage(tmpMsg);
							}
							log("strs.length 6: " + strs.length);
							
							log("strs.length 7: " + strs.length);
						}
					}
				}
			}
		}
	}

	// 연결 해제될 때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
//			String senderId = getMemberId(session);
//			if(senderId!=null) {	// 로그인 값이 있는 경우만
//				log(senderId + " 연결 종료됨");
//				users.remove(senderId);
		sessions.remove(session);
//			}
	}

	// 에러 발생시
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		log(session.getId() + " 익셉션 발생: " + exception.getMessage());

	}

	// 로그 메시지
	private void log(String logmsg) {
		System.out.println(new Date() + " : " + logmsg);
	}

	// 웹소켓에 id 가져오기
	// 접속한 유저의 http세션을 조회하여 id가져오기
	private String getMemberId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		String m_name = (String) httpSession.get("loginName"); // 세션에 저장된 m_id 기준 조회
		if (m_name == null)
			log("m_name가 왜 널이냐@@@@@@@@@@@@@@@@@@@@@@@");
		return m_name == null ? null : m_name;

	}
}
