package starling.text
{
   public class CharLocation
   {
      
      private static var sInstancePool:Vector.<CharLocation> = new Vector.<CharLocation>(0);
      
      private static var sVectorPool:Array = [];
      
      private static var sInstanceLoan:Vector.<CharLocation> = new Vector.<CharLocation>(0);
      
      private static var sVectorLoan:Array = [];
       
      
      public var char:BitmapChar;
      
      public var scale:Number;
      
      public var x:Number;
      
      public var y:Number;
      
      public function CharLocation(param1:BitmapChar)
      {
         super();
         reset(param1);
      }
      
      public static function instanceFromPool(param1:BitmapChar) : CharLocation
      {
         var _loc2_:CharLocation = sInstancePool.length > 0?sInstancePool.pop():new CharLocation(param1);
         _loc2_.reset(param1);
         sInstanceLoan[sInstanceLoan.length] = _loc2_;
         return _loc2_;
      }
      
      public static function vectorFromPool() : Vector.<CharLocation>
      {
         var _loc1_:Vector.<CharLocation> = sVectorPool.length > 0?sVectorPool.pop():new Vector.<CharLocation>(0);
         _loc1_.length = 0;
         sVectorLoan[sVectorLoan.length] = _loc1_;
         return _loc1_;
      }
      
      public static function rechargePool() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = undefined;
         while(sInstanceLoan.length > 0)
         {
            _loc1_ = sInstanceLoan.pop();
            _loc1_.char = null;
            sInstancePool[sInstancePool.length] = _loc1_;
         }
         while(sVectorLoan.length > 0)
         {
            _loc2_ = sVectorLoan.pop();
            _loc2_.length = 0;
            sVectorPool[sVectorPool.length] = _loc2_;
         }
      }
      
      private function reset(param1:BitmapChar) : CharLocation
      {
         this.char = param1;
         return this;
      }
   }
}
