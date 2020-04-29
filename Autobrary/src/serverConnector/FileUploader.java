package serverConnector;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.security.InvalidKeyException;

import io.minio.MinioClient;
import io.minio.errors.MinioException;

public class FileUploader {
  public FileUploader(String remoteName, String localPath) throws NoSuchAlgorithmException, IOException, InvalidKeyException{
    try {
    	//********보안정보 취급 주의**********
      MinioClient minioClient = new MinioClient("http://slobrary.com", 9000, "slo", "legoslo2020");
      minioClient.putObject("slo", remoteName, localPath, null);
    } catch(MinioException e) {
      System.out.println("Error occurred: " + e);
    }
  }
}