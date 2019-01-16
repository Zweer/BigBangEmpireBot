package spine
{
   public class Pool
   {
       
      
      var items:Vector.<Object>;
      
      var instantiator:Function;
      
      public function Pool(param1:Function)
      {
         items = new Vector.<Object>();
         super();
         this.instantiator = param1;
      }
      
      public function obtain() : Object
      {
         return this.items.length > 0?this.items.pop():this.instantiator();
      }
      
      public function free(param1:Object) : void
      {
         if(param1 is Poolable)
         {
            Poolable(param1).reset();
         }
         items.push(param1);
      }
      
      public function freeAll(param1:Vector.<Object>) : void
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < param1.length)
         {
            free(param1[_loc2_]);
            _loc2_++;
         }
      }
      
      public function clear() : void
      {
         items.length = 0;
      }
   }
}
