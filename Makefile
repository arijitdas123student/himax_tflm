#=============================================================
# Toolchain definitions
#=============================================================
CC = ccac
CXX = ccac
LD = ccac

RM = rm -rf
DL = curl -Ls -f
UNZIP = unzip 

LIB_LINK = https://www.himax.com.tw/we-i/himax_tflu_tree/thrid_party_lib_v01.zip
LIB_LOC = third_party/
LIB_NAME = lib.zip

MODEL_LINK = https://www.himax.com.tw/we-i/himax_tflu_tree/model_setting_v02.zip
MODEL_LOC = tensorflow/lite/micro/tools/make/downloads/
MODEL_NAME = model.zip

SDK_LINK = https://www.himax.com.tw/we-i/himax_we1_sdk_v12.zip
SDK_LOC = .
SDK_NAME = sdk.zip

GEN_TOOL_DIR = image_gen_linux_v3
GEN_TOOL_NAME = image_gen

#=============================================================
# Files and directories
#=============================================================

SRCS := \
tensorflow/lite/micro/micro_interpreter.cc \
tensorflow/lite/micro/all_ops_resolver.cc \
tensorflow/lite/micro/simple_memory_allocator.cc \
tensorflow/lite/micro/memory_helpers.cc \
tensorflow/lite/micro/recording_micro_allocator.cc \
tensorflow/lite/micro/micro_error_reporter.cc \
tensorflow/lite/micro/micro_time.cc \
tensorflow/lite/micro/recording_simple_memory_allocator.cc \
tensorflow/lite/micro/micro_string.cc \
tensorflow/lite/micro/micro_profiler.cc \
tensorflow/lite/micro/micro_utils.cc \
tensorflow/lite/micro/himax_we1_evb/debug_log.cc \
tensorflow/lite/micro/micro_optional_debug_tools.cc \
tensorflow/lite/micro/test_helpers.cc \
tensorflow/lite/micro/micro_allocator.cc \
tensorflow/lite/micro/benchmarks/keyword_scrambled_model_data.cc \
tensorflow/lite/micro/kernels/logistic.cc \
tensorflow/lite/micro/kernels/arc_mli/conv.cc \
tensorflow/lite/micro/kernels/prelu.cc \
tensorflow/lite/micro/kernels/dequantize.cc \
tensorflow/lite/micro/kernels/l2norm.cc \
tensorflow/lite/micro/kernels/resize_nearest_neighbor.cc \
tensorflow/lite/micro/kernels/tanh.cc \
tensorflow/lite/micro/kernels/activations.cc \
tensorflow/lite/micro/kernels/arg_min_max.cc \
tensorflow/lite/micro/kernels/pad.cc \
tensorflow/lite/micro/kernels/reduce.cc \
tensorflow/lite/micro/kernels/unpack.cc \
tensorflow/lite/micro/kernels/sub.cc \
tensorflow/lite/micro/kernels/add.cc \
tensorflow/lite/micro/kernels/split.cc \
tensorflow/lite/micro/kernels/circular_buffer.cc \
tensorflow/lite/micro/kernels/kernel_runner.cc \
tensorflow/lite/micro/kernels/floor.cc \
tensorflow/lite/micro/kernels/round.cc \
tensorflow/lite/micro/kernels/ceil.cc \
tensorflow/lite/micro/kernels/svdf.cc \
tensorflow/lite/micro/kernels/hard_swish.cc \
tensorflow/lite/micro/kernels/arc_mli/pooling.cc \
tensorflow/lite/micro/kernels/concatenation.cc \
tensorflow/lite/micro/kernels/neg.cc \
tensorflow/lite/micro/kernels/quantize.cc \
tensorflow/lite/micro/kernels/ethosu.cc \
tensorflow/lite/micro/kernels/mul.cc \
tensorflow/lite/micro/kernels/maximum_minimum.cc \
tensorflow/lite/micro/kernels/reshape.cc \
tensorflow/lite/micro/kernels/strided_slice.cc \
tensorflow/lite/micro/kernels/softmax.cc \
tensorflow/lite/micro/kernels/pack.cc \
tensorflow/lite/micro/kernels/kernel_util.cc \
tensorflow/lite/micro/kernels/logical.cc \
tensorflow/lite/micro/kernels/elementwise.cc \
tensorflow/lite/micro/kernels/comparisons.cc \
tensorflow/lite/micro/kernels/arc_mli/fully_connected.cc \
tensorflow/lite/micro/kernels/arc_mli/depthwise_conv.cc \
tensorflow/lite/micro/memory_planner/linear_memory_planner.cc \
tensorflow/lite/micro/memory_planner/greedy_memory_planner.cc \
tensorflow/lite/micro/testing/test_conv_model.cc \
tensorflow/lite/c/common.c \
tensorflow/lite/core/api/error_reporter.cc \
tensorflow/lite/core/api/flatbuffer_conversions.cc \
tensorflow/lite/core/api/op_resolver.cc \
tensorflow/lite/core/api/tensor_utils.cc \
tensorflow/lite/kernels/internal/quantization_util.cc \
tensorflow/lite/kernels/kernel_util.cc \
tensorflow/lite/micro/testing/test_utils.cc

PD_SRCS := \
tensorflow/lite/micro/kernels/arc_mli/scratch_buffers.cc \
tensorflow/lite/micro/kernels/arc_mli/scratch_buf_mgr.cc \
tensorflow/lite/micro/kernels/arc_mli/mli_slicers.cc \
tensorflow/lite/micro/examples/person_detection_experimental/himax_we1_evb/detection_responder.cc \
tensorflow/lite/micro/examples/person_detection_experimental/himax_we1_evb/image_provider.cc \
tensorflow/lite/micro/examples/person_detection_experimental/main.cc \
tensorflow/lite/micro/examples/person_detection_experimental/main_functions.cc \
tensorflow/lite/micro/examples/person_detection_experimental/model_settings.cc \
tensorflow/lite/micro/tools/make/downloads/person_model_int8/person_detect_model_data.cc

MW_SRCS := \
tensorflow/lite/micro/kernels/arc_mli/scratch_buffers.cc \
tensorflow/lite/micro/kernels/arc_mli/scratch_buf_mgr.cc \
tensorflow/lite/micro/kernels/arc_mli/mli_slicers.cc \
tensorflow/lite/micro/examples/magic_wand/main.cc \
tensorflow/lite/micro/examples/magic_wand/main_functions.cc \
tensorflow/lite/micro/examples/magic_wand/magic_wand_model_data.cc \
tensorflow/lite/micro/examples/magic_wand/himax_we1_evb/accelerometer_handler.cc \
tensorflow/lite/micro/examples/magic_wand/gesture_predictor.cc \
tensorflow/lite/micro/examples/magic_wand/output_handler.cc

MS_SRCS := \
tensorflow/lite/micro/kernels/arc_mli/scratch_buffers.cc \
tensorflow/lite/micro/kernels/arc_mli/scratch_buf_mgr.cc \
tensorflow/lite/micro/kernels/arc_mli/mli_slicers.cc \
tensorflow/lite/micro/examples/micro_speech/main.cc \
tensorflow/lite/micro/examples/micro_speech/main_functions.cc \
tensorflow/lite/micro/examples/micro_speech/himax_we1_evb/audio_provider.cc \
tensorflow/lite/micro/examples/micro_speech/feature_provider.cc \
tensorflow/lite/micro/examples/micro_speech/micro_features/no_micro_features_data.cc \
tensorflow/lite/micro/examples/micro_speech/micro_features/yes_micro_features_data.cc \
tensorflow/lite/micro/examples/micro_speech/micro_features/model.cc \
tensorflow/lite/micro/examples/micro_speech/recognize_commands.cc \
tensorflow/lite/micro/examples/micro_speech/himax_we1_evb/command_responder.cc \
tensorflow/lite/micro/examples/micro_speech/micro_features/micro_features_generator.cc \
tensorflow/lite/micro/examples/micro_speech/micro_features/micro_model_settings.cc \
tensorflow/lite/experimental/microfrontend/lib/fft.cc \
tensorflow/lite/experimental/microfrontend/lib/fft_util.cc \
tensorflow/lite/experimental/microfrontend/lib/filterbank.c \
tensorflow/lite/experimental/microfrontend/lib/filterbank_util.c \
tensorflow/lite/experimental/microfrontend/lib/frontend.c \
tensorflow/lite/experimental/microfrontend/lib/frontend_util.c \
tensorflow/lite/experimental/microfrontend/lib/log_lut.c \
tensorflow/lite/experimental/microfrontend/lib/log_scale.c \
tensorflow/lite/experimental/microfrontend/lib/log_scale_util.c \
tensorflow/lite/experimental/microfrontend/lib/noise_reduction.c \
tensorflow/lite/experimental/microfrontend/lib/noise_reduction_util.c \
tensorflow/lite/experimental/microfrontend/lib/pcan_gain_control.c \
tensorflow/lite/experimental/microfrontend/lib/pcan_gain_control_util.c \
tensorflow/lite/experimental/microfrontend/lib/window.c \
tensorflow/lite/experimental/microfrontend/lib/window_util.c \
tensorflow/lite/micro/tools/make/downloads/kissfft/kiss_fft.c \
tensorflow/lite/micro/tools/make/downloads/kissfft/tools/kiss_fftr.c


HW_SRCS := \
tensorflow/lite/micro/kernels/arc_mli/scratch_buffers.cc \
tensorflow/lite/micro/kernels/arc_mli/scratch_buf_mgr.cc \
tensorflow/lite/micro/kernels/arc_mli/mli_slicers.cc \
tensorflow/lite/micro/examples/handwriting/himax_we1_evb/detection_responder.cc \
tensorflow/lite/micro/examples/handwriting/himax_we1_evb/image_provider.cc \
tensorflow/lite/micro/examples/handwriting/main.cc \
tensorflow/lite/micro/examples/handwriting/main_functions.cc \
tensorflow/lite/micro/examples/handwriting/model_settings.cc \
tensorflow/lite/micro/tools/make/downloads/handwriting/model_data.cc


OBJS := \
$(patsubst %.cc,%.o,$(patsubst %.c,%.o,$(SRCS)))

PD_OBJS := \
$(patsubst %.cc,%.o,$(patsubst %.c,%.o,$(PD_SRCS)))

MW_OBJS := \
$(patsubst %.cc,%.o,$(patsubst %.c,%.o,$(MW_SRCS)))

MS_OBJS := \
$(patsubst %.cc,%.o,$(patsubst %.c,%.o,$(MS_SRCS)))

HW_OBJS := \
$(patsubst %.cc,%.o,$(patsubst %.c,%.o,$(HW_SRCS)))
#=============================================================
# Applications settings
#=============================================================

CXXFLAGS+= \
-Wstrict-aliasing \
-DTF_LITE_STATIC_MEMORY \
-Werror \
-Wsign-compare \
-Wdouble-promotion \
-Wshadow \
-Wunused-variable \
-Wmissing-field-initializers \
-Wunused-function \
-DNDEBUG \
-O3 \
-fno-rtti \
-DSCRATCH_MEM_Z_SIZE=0x10000 \
-DNDEBUG \
-g \
-DCPU_ARC \
-Hnosdata \
-DTF_LITE_STATIC_MEMORY \
-tcf=arcem9d_wei_r16.tcf \
-Hnocopyr \
-Hpurge \
-Hcl \
-fslp-vectorize-aggressive \
-ffunction-sections \
-fdata-sections \
-tcf_core_config \
-I. \
-I./third_party/gemmlowp \
-I./third_party/flatbuffers/include \
-I./third_party/ruy \
-I./third_party/arc_mli_package/include \
-I./third_party/arc_mli_package/include/api \
-I./tensorflow/lite/micro/tools/make/downloads/kissfft

CCFLAGS+= \
-DTF_LITE_STATIC_MEMORY \
-DNDEBUG \
-O3 \
-DNDEBUG \
-g \
-DCPU_ARC \
-Hnosdata \
-DTF_LITE_STATIC_MEMORY \
-tcf=arcem9d_wei_r16.tcf \
-Hnocopyr \
-Hpurge \
-Hcl \
-fslp-vectorize-aggressive \
-ffunction-sections \
-fdata-sections \
-tcf_core_config \
-I. \
-I./third_party/gemmlowp \
-I./third_party/flatbuffers/include \
-I./third_party/ruy \
-I./third_party/arc_mli_package/include \
-I./third_party/arc_mli_package/include/api \
-I./tensorflow/lite/micro/tools/make/downloads/kissfft

LDFLAGS+= \
-Hheap=8192 \
-tcf=arcem9d_wei_r16.tcf \
-Hnocopyr \
-m \
-Hldopt=-Coutput=$(MAP_NAME).map \
memory.lcf \
-Hldopt=-Bgrouplib \
libembarc.a \
libbss.a \
third_party/arc_mli_package/bin/himax_arcem9d_r16/release/libmli.a
#=============================================================
# Common rules
#=============================================================
.PHONY: all person_detection_int8 magic_wand micro_speech

%.o: %.cc
	$(CXX) $(CXXFLAGS) $(EXT_CFLAGS) $(INCLUDES) -c $< -o $@

%.o: %.c
	$(CC) $(CCFLAGS) $(EXT_CFLAGS) $(INCLUDES) -c $< -o $@


#=================================================================
# Global rules
#=================================================================
all: 
	$(error "please specific example=")

person_detection_int8: MAP_NAME = person_detection_int8
person_detection_int8: person_detection_int8.elf

micro_speech: MAP_NAME = micro_speech
micro_speech: micro_speech.elf

magic_wand: MAP_NAME = magic_wand
magic_wand: magic_wand.elf 

handwriting: MAP_NAME = handwriting
handwriting: handwriting.elf

person_detection_int8.elf : $(OBJS) $(PD_OBJS) 
	$(CXX) $(CXXFLAGS) -o $@ $(OBJS) $(PD_OBJS) $(LDFLAGS)

micro_speech.elf : $(OBJS) $(MS_OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $(OBJS) $(MS_OBJS) $(LDFLAGS)
	
magic_wand.elf : $(OBJS) $(MW_OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $(OBJS) $(MW_OBJS) $(LDFLAGS)

handwriting.elf : $(OBJS) $(HW_OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $(OBJS) $(HW_OBJS) $(LDFLAGS)
		
clean:
	@echo 'cleaning'
	-@$(RM) $(OBJS) $(PD_OBJS) $(MW_OBJS) $(MS_OBJS) $(HW_OBJS)
	-@$(RM) *.elf
	-@$(RM) *.map
	
download: $(MODEL_LOC)
	@echo 'downloading'
	@$(DL) $(LIB_LINK)  -o $(LIB_NAME)
	@$(DL) $(MODEL_LINK)  -o $(MODEL_NAME)
	@$(DL) $(SDK_LINK)  -o $(SDK_NAME)
	@$(UNZIP) -o $(LIB_NAME) -d $(LIB_LOC)
	@$(UNZIP) -o $(MODEL_NAME) -d $(MODEL_LOC)
	@$(UNZIP) -o $(SDK_NAME) -d $(SDK_LOC)  
	@$(RM) $(LIB_NAME)
	@$(RM) $(MODEL_NAME)
	@$(RM) $(SDK_NAME)
	
$(MODEL_LOC):
	@mkdir -p $@

flash:
ifdef example
	@export PATH=$(shell pwd)/$(GEN_TOOL_DIR)/:$$PATH && \
	cp $(example).elf $(example).map $(GEN_TOOL_DIR) && \
	cd $(GEN_TOOL_DIR) && \
	$(GEN_TOOL_NAME) -e $(example).elf -m $(example).map -o $(example).img && \
	cp $(example).img .. && \
	rm $(example).elf $(example).map $(example).img
else
	$(error "please specific example=")
endif
 	
