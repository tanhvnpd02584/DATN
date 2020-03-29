package com.tranquocdai.freshmarket.controller;

import com.tranquocdai.freshmarket.dto.PurchaseAddDTO;
import com.tranquocdai.freshmarket.dto.PurchaseUpdateDTO;
import com.tranquocdai.freshmarket.model.*;
import com.tranquocdai.freshmarket.repository.*;
import com.tranquocdai.freshmarket.response.ErrorResponse;
import com.tranquocdai.freshmarket.response.SuccessfulResponse;
import com.tranquocdai.freshmarket.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.time.LocalDateTime;
import java.util.*;

@RestController
public class PurchaseController {
    @Autowired
    PurchaseRepository purchaseRepository;

    @Autowired
    PostRepository postRepository;

    @Autowired
    StatusPurchaseRepository statusPurchaseRepository;

    @Autowired
    BaseService baseService;

    @GetMapping("/purchases")
    public ResponseEntity getAllPurchase() {
        try {
            Collection<Purchase> purchaseList = purchaseRepository.findAll();
            return new ResponseEntity(new SuccessfulResponse(purchaseList), HttpStatus.OK);
        } catch (Exception ex) {
            Map<String, String> errors = new HashMap<>();
            errors.put("message", "get data not successfully");
            return new ResponseEntity(new ErrorResponse(errors), HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping("/purchases/{postId}")
    public ResponseEntity readAllPurchase(@PathVariable("postId") Long id) {
        try {
            if (!postRepository.findById(id).isPresent()) {
                Map<String, String> errors = new HashMap<>();
                errors.put("message", "post id is not existed");
                return new ResponseEntity(new ErrorResponse(errors),
                        HttpStatus.NOT_FOUND);
            }
            Post post = postRepository.findById(id).get();
            Collection<Purchase> purchaseList = purchaseRepository.findAllByPost(post);
            return new ResponseEntity(new SuccessfulResponse(purchaseList), HttpStatus.OK);
        } catch (Exception ex) {
            Map<String, String> errors = new HashMap<>();
            errors.put("message", "get data not successfully");
            return new ResponseEntity(new ErrorResponse(errors), HttpStatus.BAD_REQUEST);
        }
    }

    @PostMapping("/purchases/create")
    public ResponseEntity createPurchase(Authentication authentication, @Valid @RequestBody PurchaseAddDTO purchaseAddDTO) {
        try {
            User user = baseService.getUser(authentication).get();
            Post post = postRepository.findById(purchaseAddDTO.getPostId()).get();
            StatusPurchase statusPurchase = statusPurchaseRepository.findById(purchaseAddDTO.getStatusPurchaseId()).get();
            Purchase purchase = new Purchase();
            purchase.setBuyer(user);
            purchase.setStatusPurchase(statusPurchase);
            purchase.setDateOfOrder(LocalDateTime.now());
            purchase.setPost(post);
            purchase.setPurchaseNumber(purchaseAddDTO.getPurchaseNumber());
            purchaseRepository.save(purchase);
            return new ResponseEntity(new SuccessfulResponse(purchase), HttpStatus.OK);
        } catch (Exception ex) {
            Map<String, String> errors = new HashMap<>();
            errors.put("message", "get data not successfully");
            return new ResponseEntity(new ErrorResponse(errors), HttpStatus.BAD_REQUEST);
        }
    }
    @PutMapping("/purchases/update")
    public ResponseEntity updatePurchase(Authentication authentication, @Valid @RequestBody PurchaseUpdateDTO purchaseUpdateDTO) {
        try {
            if (!baseService.getUser(authentication).isPresent()) {
                Map<String, String> errors = new HashMap<>();
                errors.put("message", "username has not existed");
                return new ResponseEntity(new ErrorResponse(errors), HttpStatus.BAD_REQUEST);
            }
            Purchase purchase = purchaseRepository.findById(purchaseUpdateDTO.getPurchaseId()).get();
            if (purchaseUpdateDTO.getPurchaseNumber() != null)
                purchase.setPurchaseNumber(purchaseUpdateDTO.getPurchaseNumber());
            if(purchaseUpdateDTO.getStatusPurchaseId()!=null) {
                StatusPurchase statusPurchase=statusPurchaseRepository.findById(purchaseUpdateDTO.getPurchaseId()).get();
                purchase.setStatusPurchase(statusPurchase);
            }
            purchaseRepository.save(purchase);
            return new ResponseEntity(new SuccessfulResponse(purchase), HttpStatus.OK);
        } catch (Exception ex) {
            Map<String, String> errors = new HashMap<>();
            errors.put("message", "get data not successfully");
            return new ResponseEntity(new ErrorResponse(errors), HttpStatus.BAD_REQUEST);
        }
    }
    @PutMapping("/purchases/{purchaseId}")
    public ResponseEntity updatePurchase(@Valid @RequestBody PurchaseUpdateDTO purchaseUpdateDTO,@PathVariable("purchaseId") Long purchaseId) {
        try {
            if (!purchaseRepository.findById(purchaseId).isPresent()) {
                Map<String, String> errors = new HashMap<>();
                errors.put("message", "username has not existed");
                return new ResponseEntity(new ErrorResponse(errors), HttpStatus.BAD_REQUEST);
            }
            Purchase purchase = purchaseRepository.findById(purchaseId).get();
            if (purchaseUpdateDTO.getPurchaseNumber() != null)
                purchase.setPurchaseNumber(purchaseUpdateDTO.getPurchaseNumber());
            if(purchaseUpdateDTO.getStatusPurchaseId()!=null) {
                StatusPurchase statusPurchase=statusPurchaseRepository.findById(purchaseUpdateDTO.getPurchaseId()).get();
                purchase.setStatusPurchase(statusPurchase);
            }
            purchaseRepository.save(purchase);
            return new ResponseEntity(new SuccessfulResponse(purchase), HttpStatus.OK);
        } catch (Exception ex) {
            Map<String, String> errors = new HashMap<>();
            errors.put("message", "get data not successfully");
            return new ResponseEntity(new ErrorResponse(errors), HttpStatus.BAD_REQUEST);
        }
    }
    @DeleteMapping("/purchases/{purchasesID}")
    public ResponseEntity deletePurchase(@PathVariable("purchasesID") Long purchasesID) {
        try {
            if (!purchaseRepository.findById(purchasesID).isPresent()) {
                Map<String, String> errors = new HashMap<>();
                errors.put("message", "purchase has not existed");
                return new ResponseEntity(new ErrorResponse(errors), HttpStatus.BAD_REQUEST);
            }
            purchaseRepository.deleteById(purchasesID);
            return new ResponseEntity(new SuccessfulResponse("delete successfully"), HttpStatus.OK);
        } catch (Exception ex) {
            Map<String, String> errors = new HashMap<>();
            errors.put("message", "get data not successfully");
            return new ResponseEntity(new ErrorResponse(errors), HttpStatus.BAD_REQUEST);
        }
    }
}