package controller.boardcontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
// @RequestMapping("/board/")
// web.xml에서 한 번 분류되었기 때문에 이걸 추가하지 말아야 함
public class BoardController {

	// localhost:8080/board/board
	@RequestMapping("board")
	public String board() {
		return "index";
	}
}
