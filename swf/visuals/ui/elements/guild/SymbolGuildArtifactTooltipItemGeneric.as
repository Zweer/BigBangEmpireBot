package visuals.ui.elements.guild
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   
   public class SymbolGuildArtifactTooltipItemGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGuildArtifactTooltipItem = null;
      
      public var artifactImage:SymbolPlaceholderGeneric = null;
      
      public var txtName:ILabel = null;
      
      public var txtInfo:ILabelArea = null;
      
      public function SymbolGuildArtifactTooltipItemGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGuildArtifactTooltipItem;
         }
         else
         {
            _nativeObject = new SymbolGuildArtifactTooltipItem();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         artifactImage = new SymbolPlaceholderGeneric(_nativeObject.artifactImage);
         txtName = FlashLabel.fromNative(_nativeObject.txtName);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
      }
      
      public function setNativeInstance(param1:SymbolGuildArtifactTooltipItem) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.artifactImage)
         {
            artifactImage.setNativeInstance(_nativeObject.artifactImage);
         }
         FlashLabel.setNativeInstance(txtName,_nativeObject.txtName);
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
      }
   }
}
