*** Settings ***
Library             RequestsLibrary
Library             Collections
Library             OperatingSystem

*** Variables ***
${base_url}         https://identity-api.ubx.ph/entity-api-cpu/api
${route}            /entities
${valid_token}     eyJraWQiOiI2UHlBQkZGU1ZhZkoxVmVCXC9qazhcL09VOTNBcjRtaFhQZHhGOFwvUVMxWHBZPSIsImFsZyI6IlJTMjU2In0.eyJzdWIiOiI1Mzk0N2FmYi1lNWUzLTQ0NjEtODFkYy00YzM2Njg5YjVhNWYiLCJldmVudF9pZCI6ImEwMGVlODU3LTYwNzYtNDZjMi04YWRjLWFhNGFjMDQ3NDAyMyIsInRva2VuX3VzZSI6ImFjY2VzcyIsInNjb3BlIjoiYXdzLmNvZ25pdG8uc2lnbmluLnVzZXIuYWRtaW4iLCJhdXRoX3RpbWUiOjE1ODA0NDc4MDMsImlzcyI6Imh0dHBzOlwvXC9jb2duaXRvLWlkcC5hcC1zb3V0aGVhc3QtMS5hbWF6b25hd3MuY29tXC9hcC1zb3V0aGVhc3QtMV9tNEp4VlJOZ1oiLCJleHAiOjE1ODA0NTE0MDUsImlhdCI6MTU4MDQ0NzgwNSwianRpIjoiZjBiZGNkNDQtOGMxMC00ZDg4LWJiNDUtMGFlYjMwMTg4ODY5IiwiY2xpZW50X2lkIjoiNTZmdGQwMms1N2pic2piZXVoczY2ZnM2M2wiLCJ1c2VybmFtZSI6ImphaXJ1c0B1YngucGgifQ.l9f_cBC3YfeSIAZcb8x2slZG21wBmzBq8G5RU-7-irCmxDmOit96GUYBDAM-OBaDEdgdw1_1lrXNQJhzXFZ3cahuXGkdPW8R3lisi47sONOOWzq_A1fP7O6CZScRrs3oHNO5HV3QbVC9lAkvKav4utuKaiQ_cQBpFs6ced8vf_o5GiThgB3e8vS-lmiRgP2ggHpR0UNh5IqLjn5WY6OEBaAIS3yeP_1JJUEUDk7qoZegMu1emGJHEX_3iAdPROx2sHvhettaaxnbMzNwMLZI1Ozd_k6soumApm9-2KzLQ-_vGla7axxBVGFr81ZGkxayI8SCe1sq18P5YN5mkdS9hQ
${invalid_token}    nL_Xl1B-FO3bhn5-NRRAc3m33HWMq0S1bxpgaWWEh6vsVsrCRao4vJeVd7A9KcuY8AXaNBdizj7MkbteJP7OixGr54KVm-u1ZgSOSd-Yiw5_L8qfnqw92tnb94kJ6qKlixjZF7136CpLi9TxM8mGAERxCjGKylaHvomt3ftaz7Z6yxteIPTYnGiMYIlpVYCjJiiGiA9yDmbp4qPnQ6Mr4Ez3nNcsm5qvRvaFaj1ELMN0QIZBy9ONFc88_lxTXH63qeWdidWPlKV5Ei2UBpF7HAQ8ofDMBgfjFa3EHuVbF09rbtgNEUoczaXuKumi7RwtA
${expired_token}     eyJraWQiOiI2UHlBQkZGU1ZhZkoxVmVCXC9qazhcL09VOTNBcjRtaFhQZHhGOFwvUVMxWHBZPSIsImFsZyI6IlJTMjU2In0.eyJzdWIiOiI1Mzk0N2FmYi1lNWUzLTQ0NjEtODFkYy00YzM2Njg5YjVhNWYiLCJldmVudF9pZCI6ImU4YWQ2MzFmLTNhMTctNGRjMS04MjlkLTY3NTUzZmViNTc2MyIsInRva2VuX3VzZSI6ImFjY2VzcyIsInNjb3BlIjoiYXdzLmNvZ25pdG8uc2lnbmluLnVzZXIuYWRtaW4iLCJhdXRoX3RpbWUiOjE1ODAzODI1NjEsImlzcyI6Imh0dHBzOlwvXC9jb2duaXRvLWlkcC5hcC1zb3V0aGVhc3QtMS5hbWF6b25hd3MuY29tXC9hcC1zb3V0aGVhc3QtMV9tNEp4VlJOZ1oiLCJleHAiOjE1ODAzODYxNjEsImlhdCI6MTU4MDM4MjU2MSwianRpIjoiM2UyOGU0YzctYTY4Zi00YjUzLThiOWItOWM2YTU3OTlmMTliIiwiY2xpZW50X2lkIjoiNTZmdGQwMms1N2pic2piZXVoczY2ZnM2M2wiLCJ1c2VybmFtZSI6ImphaXJ1c0B1YngucGgifQ.yMiXGD1A9ivAWIz2S0IWWgC_SRjQphX1Rp6dQDXChXEUee2PcRAOR44mLSBzt4UNtFrk6JENpf6X22jc_ML_OYshqaLMdynUjE82cc896ERT_9F1_hHnCJp6spa8ELV_BvAPTaxd2_A30YPLQLH8jWrBoM7kK1-uq9bgI-NP_rf7Z5AInX21xKaa1TWqCruUE2cybIzis

*** Test Cases ***
Get Entities With Valid Token In Headers
    create session      MySession       ${base_url}
    ${headers}          create dictionary   Authorization=${valid_token}
    ${response} =       get request     MySession       ${route}        headers=${headers}
    log                 ${response}
    log to console      ${response.status_code}
    #VALIDATIONS
    ${status_code} =    convert to string       ${response.status_code}
    ${body} =           convert to string       ${response.json()}
    should be equal     ${status_code}      200
    should contain      ${body}             Successfully retrieved entity list
Get Entities And Check Entity Name and Status
    create session      MySession       ${base_url}
    ${headers}          create dictionary   Authorization=${valid_token}
    ${response} =       get request     MySession       ${route}        headers=${headers}
    log                 ${response}
    log to console      ${response.json()}
    #VALIDATIONS
    ${body} =           convert to string  ${response.json()}
    should contain      ${body}             CPU
    should contain      ${body}             VALID
Get Entities With Invalid Token In Headers
    create session      MySession       ${base_url}
    ${headers}          create dictionary   Authorization=${expired_token}}
    ${response} =       get request     MySession       ${route}        headers=${headers}
    log                 ${response}
    log to console      ${response.status_code}
    #VALIDATIONS
    ${status_code} =    convert to string       ${response.status_code}
    ${body} =           convert to string       ${response.json()}
    should be equal     ${status_code}      401
    should contain      ${body}             Invalid token
Get Entities With Expired Token In Headers
    create session      MySession       ${base_url}
    ${headers}          create dictionary   Authorization=${expired_token}
    ${response} =       get request     MySession       ${route}        headers=${headers}
    log                 ${response}
    log to console      ${response.status_code}
    #VALIDATIONS
    ${status_code} =    convert to string       ${response.status_code}
    ${body} =           convert to string       ${response.json()}
    should be equal     ${status_code}      401
    should contain      ${body}             Token has expired