package com.playata.application.data.application
{
   import com.playata.framework.core.TypedObject;
   
   public class ApplicationOptions extends TypedObject
   {
       
      
      public function ApplicationOptions()
      {
         super();
      }
      
      public function get dontCacheSounds() : Boolean
      {
         return getBoolean("dontCacheSounds");
      }
      
      public function set dontCacheSounds(param1:Boolean) : void
      {
         setBoolean("dontCacheSounds",param1);
      }
      
      public function get defaultSoundStreamUrl() : String
      {
         return getString("defaultSoundStreamUrl");
      }
      
      public function set defaultSoundStreamUrl(param1:String) : void
      {
         setString("defaultSoundStreamUrl",param1);
      }
      
      public function get additionalSSOLoginParams() : TypedObject
      {
         return getTypedObject("additionalSSOLoginParams");
      }
      
      public function set additionalSSOLoginParams(param1:TypedObject) : void
      {
         setTypedObject("additionalSSOLoginParams",param1);
      }
   }
}
