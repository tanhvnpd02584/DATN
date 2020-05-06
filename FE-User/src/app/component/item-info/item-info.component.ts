import { Component, OnInit } from '@angular/core';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { CreateCommentComponent } from './create-comment/create-comment.component';
import { Router } from '@angular/router';
import { LocalStoreManager } from '../../services/local-store-manager.service';
import { EndpointFactory } from '../../services/endpoint-factory.service';
import { PostElement } from '../model/post.model';

@Component({
    selector: 'app-item-info',
    templateUrl: './item-info.component.html',
    styleUrls: ['./item-info.component.scss']
})
export class ItemInfoComponent implements OnInit {

    constructor(private router: Router, private modalService: NgbModal, private localStoreManager: LocalStoreManager,
        private endpointFactory: EndpointFactory) {
        this.loadData();
    }
    currentRate = 0;
    numberItem = 1;
    dataContent: any;
    dataComment: any[];
    checkLoadData = false;
    checkUserRate: false;
    checkUserComment: false;
    ngOnInit() {
    }

    loadData() {
        this.endpointFactory.getEndPoint('posts/' + this.localStoreManager.getPostSelected()).subscribe(data => {
            if (data.status === 'success') {
                const post = new PostElement();
                const element = data.data.post;
                post.postId = element.id;
                post.postName = element.postName;
                post.userName = element.user.userName;
                post.userElement = element.user;
                post.unitPrice = element.unitPrice;
                post.address = element.address;
                post.dateOfPost = new Date(element.dateOfPost[0], element.dateOfPost[1], element.dateOfPost[2]);
                post.province = element.province;
                post.imageURL = element.imagePost.url;
                post.category = element.category;
                if (element.description.length < 300) {
                    post.description = element.description;
                } else {
                    post.description = element.description.substr(0, 300) + '...';
                }
                post.calculationUnit = element.calculationUnit;
                post.averageRate = Number.parseFloat(data.data.averageRate);
                this.dataComment = data.data.userCommentDTOList;
                this.dataContent = post;
                this.checkLoadData = true;
            }
        });
    }

    changeNumber(change: String): void {
        if (change === 'add') {
            this.numberItem += 1;
        } else {
            if (this.numberItem > 0) {
                this.numberItem -= 1;
            }
        }
    }

    purchaseItem(): void {
        const dataPurchase = [
            this.dataContent.postId,
            this.dataContent.postName,
            this.dataContent.unitPrice,
            this.numberItem,
            this.dataContent.imageURL,
            this.dataContent.calculationUnit.unitName,
        ];
        this.localStoreManager.setDataPurchase(dataPurchase.toString());
        this.router.navigateByUrl('/component/confirm-purchase');
    }
    createComment(): void {
        const modalRef =
            this.modalService.open(CreateCommentComponent, { size: 'lg', windowClass: 'create-comment-dialog', centered: true });
        modalRef.componentInstance.data = { data: this.dataContent };
        modalRef.componentInstance.output.subscribe((res) => {
            if (res === 'success') {
                this.loadData();
            }
        });
    }

    addStorageCart(): void {
        const dataPurchase = {
            postId: this.dataContent.postId,
            postName: this.dataContent.postName,
            unitPrice: this.dataContent.unitPrice,
            numberItem: this.numberItem,
            userName: this.dataContent.userName,
            province: this.dataContent.province.nameProvince,
            imageURL: this.dataContent.imageURL,
            address: this.dataContent.address,
            unitName: this.dataContent.calculationUnit.unitName,
        };
        this.localStoreManager.setStorageCart(JSON.stringify(dataPurchase));
    }
}
