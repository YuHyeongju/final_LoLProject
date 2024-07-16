package com.itbank.service;

import java.time.Duration;
import java.util.ArrayList;
import java.util.List;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.itbank.model.LCKVideoDTO;
import com.itbank.repository.LCKVideoDAO;

@Service
public class LCKVideoService {
	
	@Autowired private LCKVideoDAO dao;

    public List<LCKVideoDTO> fetchVideos() {
        List<LCKVideoDTO> videos = new ArrayList<>();
        WebDriver driver = null;

        try {
            String driverPath = "C:/Users/82106/Desktop/chromedriver-win64/chromedriver.exe";
            System.setProperty("webdriver.chrome.driver", driverPath);

            driver = new ChromeDriver();
            WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10)); // 30초 동안 대기

            driver.get("https://game.naver.com/esports/League_of_Legends/videos/league/lck?type=3");

            // 페이지가 완전히 로드될 때까지 기본 콘텐츠 로딩을 대기
            wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".video_card_video__2EJ5V")));

            // "영상 더보기" 버튼을 두 번 클릭하기 위한 로직
            for (int i = 0; i < 4; i++) {
                try {
                    WebElement moreButton = wait.until(ExpectedConditions.elementToBeClickable(By.cssSelector("button.video_list_more_btn__2NpS1")));
                    moreButton.click();
                    // 클릭 후 콘텐츠 로딩을 위해 잠시 대기
                    Thread.sleep(5000); // 로딩 시간에 따라 조절 필요
                } catch (Exception e) {
                    System.out.println("더 보기 버튼 클릭 중 오류 발생 또는 더 이상 불러올 콘텐츠가 없습니다.");
                    break; // 더 이상 클릭할 버튼이 없으면 반복 종료
                }
            }

            // 새로운 콘텐츠가 로드된 후의 페이지 소스를 가져옴
            String pageSource = driver.getPageSource();
            Document doc = Jsoup.parse(pageSource);
            Elements videoElements = doc.select(".video_card_video__2EJ5V"); // 새로 로드된 콘텐츠 포함

            for (Element video : videoElements) {
                String baseUrl = "https://game.naver.com";
                String videoUrl = baseUrl + video.select("a").attr("href");
                String imageUrl = video.select("img").attr("src"); // 'img' 태그 내 'src' 속성
                String title = video.select(".video_card_title__K2yVf").text();
                if(videoUrl == "" || imageUrl == "" || title == "") {
                	continue;
                }
                System.out.println("videoUrl : " + videoUrl);
                System.out.println("imageUrl : " + imageUrl);
                System.out.println("title : " + title);
                System.out.println("============================================");
                LCKVideoDTO videoDTO = new LCKVideoDTO();
                videoDTO.setVideoUrl(videoUrl);
                videoDTO.setImageUrl(imageUrl);
                videoDTO.setTitle(title);

                videos.add(videoDTO);
            }
        } finally {
            if (driver != null) {
                driver.quit();
            }
        }
        return videos;
    }

	public int addVideo(LCKVideoDTO dto) {
		return dao.addVideo(dto);
	}

	public List<LCKVideoDTO> getVideos() {
		return dao.getVideos();
	}

	public void deleteVideos() {
		dao.deleteVideos();
	}
}
