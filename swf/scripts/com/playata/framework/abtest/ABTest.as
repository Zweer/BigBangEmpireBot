package com.playata.framework.abtest
{
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.IDisposable;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.network.request.RequestData;
   
   public class ABTest implements IDisposable
   {
       
      
      private var _data:TypedObject = null;
      
      public function ABTest(param1:String, param2:TypedObject)
      {
         super();
         _data = param2;
         _data.setString("key",param1);
      }
      
      public function dispose() : void
      {
         _data = null;
      }
      
      public function updateData(param1:TypedObject) : void
      {
         _data.extend(param1);
      }
      
      public function get id() : int
      {
         return _data.getInt("id");
      }
      
      public function get variation() : int
      {
         return _data.getInt("variation");
      }
      
      public function get key() : String
      {
         return _data.getString("key");
      }
      
      public function init() : void
      {
         Environment.application.sendActionRequest("initCampaign",RequestData.fromData({
            "campaign_id":id,
            "campaign_variation":variation
         }),null,false);
      }
      
      public function track(param1:String) : void
      {
         Environment.application.sendActionRequest("trackCampaign",RequestData.fromData({
            "campaign_id":id,
            "campaign_variation":variation,
            "value":param1
         }),null,false);
      }
   }
}
