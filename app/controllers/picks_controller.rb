class PicksController < ApplicationController

  def create
    system = System.find(params[:system_id])
    @block = Block.find(params[:block_id])
    if Pick.create(system_id:system.id, block_id:@block.id)
      pick = Pick.find_by(system_id:system.id, block_id:@block.id)
      pick.update(order:system.blocks.count.to_i)
      @systems = current_user.systems
    end
  end

  def destroy
    system = System.find(params[:system_id])
    delete_block = Block.find(params[:block_id])
    if delete_pick = Pick.find_by(system_id:system.id, block_id:delete_block.id)
      # 削除するpickよりもorderカラムの値が大きいもの(順番が後ろ)はorderカラムの値を-1して１つずらす。
      system.blocks.each do |block|
        pick = Pick.find_by(system_id:system.id, block_id:block.id)
        if pick.order > delete_pick.order 
          pick.update(order:pick.order.to_i - 1)
        end
      end
      delete_pick.delete
      @systems = current_user.systems
      @block = delete_block
    end
  end

  def up
    @system = System.find(params[:system_id])
    up_block = Block.find(params[:block_id])
    if up_pick = Pick.find_by(system_id:@system.id, block_id:up_block.id)
      # upしたい要素とその１つ上の要素を入れ替える。
      @system.blocks.each do |block|
        pick = Pick.find_by(system_id:@system.id, block_id:block.id)
        if up_pick.order - pick.order == 1
          pick.update(order:pick.order.to_i + 1)
          up_pick.update(order:up_pick.order.to_i - 1)
          @blocks = @system.blocks.order(order: "ASC")
          break
        end
      end
    end
  end

  def down
    @system = System.find(params[:system_id])
    down_block = Block.find(params[:block_id])
    if down_pick = Pick.find_by(system_id:@system.id, block_id:down_block.id)
      # downしたい要素とその１つ下の要素を入れ替える。
      @system.blocks.each do |block|
        pick = Pick.find_by(system_id:@system.id, block_id:block.id)
        if pick.order - down_pick.order == 1
          pick.update(order:pick.order.to_i - 1)
          down_pick.update(order:down_pick.order.to_i + 1)
          @blocks = @system.blocks.order(order: "ASC")
          break
        end
      end
    end
  end

end
