package com.playata.application.util
{
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.ILinkHandler;
   import com.playata.framework.core.logging.Logger;
   
   public class DefaultLinkHandler implements ILinkHandler
   {
       
      
      public function DefaultLinkHandler()
      {
         super();
      }
      
      public function openLink(param1:String) : void
      {
         Logger.info("[WebLinkHandler] Opening URL: " + param1);
         Environment.platform.openLink(param1);
      }
   }
}
