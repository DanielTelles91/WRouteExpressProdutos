package com.routeexpress.wrouteexpressprodutos.ferramentas;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
 
public class SHA1 {

   
    public static  char[] gerarHashSenhaPBKDF2(String senha) throws NoSuchAlgorithmException, InvalidKeySpecException {
    // PBKDF2 with SHA-1 as the hashing algorithm. Note that the NIST
        // specifically names SHA-1 as an acceptable hashing algorithm for PBKDF2
        String algorithm = "PBKDF2WithHmacSHA1";
        // SHA-1 generates 160 bit hashes, so that's what makes sense here
        int derivedKeyLength = 160;
    // Pick an iteration count that works for you. The NIST recommends at
        // least 1,000 iterations:
        // http://csrc.nist.gov/publications/nistpubs/800-132/nist-sp800-132.pdf
        // iOS 4.x reportedly uses 10,000:
        // http://blog.crackpassword.com/2010/09/smartphone-forensics-cracking-blackberry-backup-passwords/
        int iterations = 2000;

    // SALT (EM SITUACOES REAIS, DEVEM SER DIFERENTES PARA CADA USUARIO)
        // Normalmente, deve ser alguma informação que, após cadastrado, não pode mais ser alterado.
        String salt = "abcd";
        KeySpec spec = new PBEKeySpec(senha.toCharArray(), salt.getBytes(), iterations, derivedKeyLength);
        SecretKeyFactory f = SecretKeyFactory.getInstance(algorithm);

        byte[] code = f.generateSecret(spec).getEncoded();

        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < code.length; i++) {
            sb.append(Integer.toHexString(0xff & code[i]));
        }
        System.out.println("Senha hash:" + senha);
        System.out.println(sb.toString()); // senha codificada
        String.valueOf(sb);
        String x =  String.valueOf(sb);
        return sb.toString().toCharArray();

    }
     
 
}
