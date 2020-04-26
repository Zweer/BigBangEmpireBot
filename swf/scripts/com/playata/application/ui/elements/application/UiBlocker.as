package com.playata.application.ui.elements.application
{
   import com.playata.application.ui.effects.ScaleInOutEffect;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.Sprite;
   import visuals.ui.base.SymbolBlockerLayerGeneric;
   
   public class UiBlocker extends Sprite
   {
       
      
      private var _content:SymbolBlockerLayerGeneric = null;
      
      private var _blockerEffect:ScaleInOutEffect = null;
      
      public function UiBlocker(param1:SymbolBlockerLayerGeneric)
      {
         _content = param1;
         super(null,_content);
         applySettings(new TypedObject({"interactionEnabled":true}));
         _content.txtStatus.visible = false;
         _blockerEffect = new ScaleInOutEffect(_content.blockIndicator,0.5,1.2);
      }
      
      override public function set visible(param1:Boolean) : void
      {
         .super.visible = param1;
         if(param1)
         {
            _blockerEffect.play();
         }
         else
         {
            _blockerEffect.stop();
         }
      }
   }
}
