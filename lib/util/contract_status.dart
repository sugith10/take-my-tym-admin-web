class ContractStatus{
  static String call(bool status){
    if(status == false){
      return "Waiting for approval";
    }else{
      return "Contract Completed";
    }
  }
}