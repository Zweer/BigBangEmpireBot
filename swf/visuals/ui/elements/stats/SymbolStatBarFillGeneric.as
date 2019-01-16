package visuals.ui.elements.stats
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolStatBarFillGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolStatBarFill = null;
      
      public var colorK:SymbolStatsBarFillColorKGeneric = null;
      
      public var colorJ:SymbolStatsBarFillColorJGeneric = null;
      
      public var colorI:SymbolStatsBarFillColorIGeneric = null;
      
      public var colorH:SymbolStatsBarFillColorHGeneric = null;
      
      public var colorG:SymbolStatsBarFillColorGGeneric = null;
      
      public var colorF:SymbolStatsBarFillColorFGeneric = null;
      
      public var colorE:SymbolStatsBarFillColorEGeneric = null;
      
      public var colorD:SymbolStatsBarFillColorDGeneric = null;
      
      public var colorC:SymbolStatsBarFillColorCGeneric = null;
      
      public var colorB:SymbolStatsBarFillColorBGeneric = null;
      
      public var colorA:SymbolStatsBarFillColorAGeneric = null;
      
      public function SymbolStatBarFillGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolStatBarFill;
         }
         else
         {
            _nativeObject = new SymbolStatBarFill();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         colorK = new SymbolStatsBarFillColorKGeneric(_nativeObject.colorK);
         colorJ = new SymbolStatsBarFillColorJGeneric(_nativeObject.colorJ);
         colorI = new SymbolStatsBarFillColorIGeneric(_nativeObject.colorI);
         colorH = new SymbolStatsBarFillColorHGeneric(_nativeObject.colorH);
         colorG = new SymbolStatsBarFillColorGGeneric(_nativeObject.colorG);
         colorF = new SymbolStatsBarFillColorFGeneric(_nativeObject.colorF);
         colorE = new SymbolStatsBarFillColorEGeneric(_nativeObject.colorE);
         colorD = new SymbolStatsBarFillColorDGeneric(_nativeObject.colorD);
         colorC = new SymbolStatsBarFillColorCGeneric(_nativeObject.colorC);
         colorB = new SymbolStatsBarFillColorBGeneric(_nativeObject.colorB);
         colorA = new SymbolStatsBarFillColorAGeneric(_nativeObject.colorA);
      }
      
      public function setNativeInstance(param1:SymbolStatBarFill) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.colorK)
         {
            colorK.setNativeInstance(_nativeObject.colorK);
         }
         if(_nativeObject.colorJ)
         {
            colorJ.setNativeInstance(_nativeObject.colorJ);
         }
         if(_nativeObject.colorI)
         {
            colorI.setNativeInstance(_nativeObject.colorI);
         }
         if(_nativeObject.colorH)
         {
            colorH.setNativeInstance(_nativeObject.colorH);
         }
         if(_nativeObject.colorG)
         {
            colorG.setNativeInstance(_nativeObject.colorG);
         }
         if(_nativeObject.colorF)
         {
            colorF.setNativeInstance(_nativeObject.colorF);
         }
         if(_nativeObject.colorE)
         {
            colorE.setNativeInstance(_nativeObject.colorE);
         }
         if(_nativeObject.colorD)
         {
            colorD.setNativeInstance(_nativeObject.colorD);
         }
         if(_nativeObject.colorC)
         {
            colorC.setNativeInstance(_nativeObject.colorC);
         }
         if(_nativeObject.colorB)
         {
            colorB.setNativeInstance(_nativeObject.colorB);
         }
         if(_nativeObject.colorA)
         {
            colorA.setNativeInstance(_nativeObject.colorA);
         }
      }
   }
}
