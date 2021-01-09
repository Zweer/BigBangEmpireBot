package visuals.ui.elements.item
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   
   public class SymbolItemTooltipSetInfoGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolItemTooltipSetInfo = null;
      
      public var txtSetName:ILabelArea = null;
      
      public var stat1:SymbolItemTooltipSetInfoStatGeneric = null;
      
      public var txtCompare1:ILabel = null;
      
      public var stat2:SymbolItemTooltipSetInfoStatGeneric = null;
      
      public var txtCompare2:ILabel = null;
      
      public var stat3:SymbolItemTooltipSetInfoStatGeneric = null;
      
      public var txtCompare3:ILabel = null;
      
      public var stat4:SymbolItemTooltipSetInfoStatGeneric = null;
      
      public var txtCompare4:ILabel = null;
      
      public function SymbolItemTooltipSetInfoGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolItemTooltipSetInfo;
         }
         else
         {
            _nativeObject = new SymbolItemTooltipSetInfo();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         txtSetName = FlashLabelArea.fromNative(_nativeObject.txtSetName);
         stat1 = new SymbolItemTooltipSetInfoStatGeneric(_nativeObject.stat1);
         txtCompare1 = FlashLabel.fromNative(_nativeObject.txtCompare1);
         stat2 = new SymbolItemTooltipSetInfoStatGeneric(_nativeObject.stat2);
         txtCompare2 = FlashLabel.fromNative(_nativeObject.txtCompare2);
         stat3 = new SymbolItemTooltipSetInfoStatGeneric(_nativeObject.stat3);
         txtCompare3 = FlashLabel.fromNative(_nativeObject.txtCompare3);
         stat4 = new SymbolItemTooltipSetInfoStatGeneric(_nativeObject.stat4);
         txtCompare4 = FlashLabel.fromNative(_nativeObject.txtCompare4);
      }
      
      public function setNativeInstance(param1:SymbolItemTooltipSetInfo) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabelArea.setNativeInstance(txtSetName,_nativeObject.txtSetName);
         if(_nativeObject.stat1)
         {
            stat1.setNativeInstance(_nativeObject.stat1);
         }
         FlashLabel.setNativeInstance(txtCompare1,_nativeObject.txtCompare1);
         if(_nativeObject.stat2)
         {
            stat2.setNativeInstance(_nativeObject.stat2);
         }
         FlashLabel.setNativeInstance(txtCompare2,_nativeObject.txtCompare2);
         if(_nativeObject.stat3)
         {
            stat3.setNativeInstance(_nativeObject.stat3);
         }
         FlashLabel.setNativeInstance(txtCompare3,_nativeObject.txtCompare3);
         if(_nativeObject.stat4)
         {
            stat4.setNativeInstance(_nativeObject.stat4);
         }
         FlashLabel.setNativeInstance(txtCompare4,_nativeObject.txtCompare4);
      }
   }
}
