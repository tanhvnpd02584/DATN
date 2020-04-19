import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { EndpointFactory } from '../../../services/endpoint-factory.service';

@Component({
    selector: 'app-change-password',
    templateUrl: './change-password.component.html',
    styleUrls: ['./change-password.component.scss']
})
export class ChangePasswordComponent implements OnInit {
    roleList: any;
    imageBase64: string;
    messageErrorArray = { corfirmPassword: 'Nhập lại mật khẩu không đúng' };
    messageError: any;
    constructor(public activeModal: NgbActiveModal, private formBuilder: FormBuilder, private endpointFactory: EndpointFactory) {
    }

    @Input() data;
    @Output() output = new EventEmitter();
    editForm: FormGroup;

    ngOnInit(): void {
        this.createForm();
    }

    createForm() {
        this.editForm = this.formBuilder.group({
            password: ['', Validators.required],
            confirmPassword: ['', Validators.required],
        });
    }

    clickClose() {
        this.activeModal.close();
    }

    onSubmit() {
        if (this.checkForm()) {
            const params: any = {
                password: this.editForm.value['password'],
                phoneNumber: this.editForm.value['phoneNumber'],
            };
            this.endpointFactory.putEndPoint(params, 'users/' + this.data.data.userId).subscribe(data => {
                if (data.status === 'success') {
                    this.output.emit('success');
                    this.activeModal.close();
                }
            });
        }
    }

    checkForm(): boolean {
        if (this.editForm.value['confirmPassword'].length > 6) {
            if (this.editForm.value['password'] !== this.editForm.value['confirmPassword']) {
                this.messageError = this.messageErrorArray.corfirmPassword;
                return false;
            }
        }
        return true;
    }
}